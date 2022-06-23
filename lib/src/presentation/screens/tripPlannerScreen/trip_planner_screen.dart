part of screens;

class TripPlannerScreen extends StatefulWidget {
  const TripPlannerScreen({Key? key, required this.from, required this.to})
      : super(key: key);
  final String from;
  final String to;

  @override
  State<TripPlannerScreen> createState() => _TripPlannerScreenState();
}

class _TripPlannerScreenState extends State<TripPlannerScreen> {
  final FocusNode destinationFocusNode = FocusNode();
  final FocusNode fromFocusNode = FocusNode();

  final TextEditingController destinationController = TextEditingController();
  final TextEditingController fromController = TextEditingController();

  @override
  void initState() {
    super.initState();
    destinationController.text = widget.to;
    fromController.text = widget.from;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: AppColors.backgroundColor,
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              FeatherIcons.mapPin,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: destinationController,
                                focusNode: destinationFocusNode,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintText: 'Where From',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: AppColors.whiteColor)
                                      .copyWith(
                                        color: AppColors.whiteColor.withOpacity(
                                          0.5,
                                        ),
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2.0,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              child: const Icon(
                                Icons.circle,
                                size: 14,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: fromController,
                                focusNode: fromFocusNode,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintText: 'Where To',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: AppColors.whiteColor)
                                      .copyWith(
                                        color: AppColors.whiteColor.withOpacity(
                                          0.5,
                                        ),
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) {},
                    itemBuilder: (BuildContext context) {
                      return {
                        'Map Info',
                        'Search along route',
                        'Share your trip',
                        'Add to Homepage'
                      }.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
            ),
            const Expanded(
              child: MapWidget(),
            ),
          ],
        ),
        bottomSheet: const TripPlannerDetails(),
      ),
    );
  }
}

class TripPlannerDetails extends StatelessWidget {
  const TripPlannerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      height: 450,
      decoration: const BoxDecoration(
        color: Color(0xff383535),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DateTimePicker(
            type: DateTimePickerType.dateTime,
            dateMask: 'd MMM, yyyy hh:mm a',
            initialValue: DateTime.now().toString(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            icon: const Icon(FeatherIcons.calendar),
            dateLabelText: 'Departure date and time',
            timeLabelText: "Hour",
            selectableDayPredicate: (date) {
              // Disable weekend days to select from the calendar
              if (date.weekday == 6 || date.weekday == 7) {
                return false;
              }

              return true;
            },
            onChanged: (val) {},
            validator: (val) {
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Nearest recommended bus stop',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: AppColors.whiteColor.withOpacity(0.6),
                ),
          ),
          DropdownButton<String>(
            value: 'Narayan Gopal Chwok Stop',
            isExpanded: true,
            icon: const Icon(PhosphorIcons.caretDown),
            elevation: 16,
            underline: Container(
              height: 1,
              color: AppColors.whiteColor.withOpacity(
                0.5,
              ),
            ),
            onChanged: (String? newValue) {},
            items: <String>[
              'Narayan Gopal Chwok Stop',
              'Chabil Chwok Stop',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Available buses',
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: AppColors.whiteColor.withOpacity(0.6),
                ),
          ),
          DropdownButton<String>(
            value: 'Sajha Yatayat',
            isExpanded: true,
            icon: const Icon(PhosphorIcons.caretDown),
            elevation: 8,
            underline: Container(
              height: 0,
              color: AppColors.whiteColor.withOpacity(0.5),
            ),
            onChanged: (String? newValue) {},
            items: <String>[
              'Sajha Yatayat',
              'Mayur Yatayat',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(value),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.personWalking,
                                  size: 18,
                                  color: AppColors.greenColor,
                                ),
                                Text(
                                  '10',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.greenColor,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Row(
                              children: [
                                Icon(
                                  PhosphorIcons.gauge,
                                  size: 18,
                                  color: AppColors.whiteColor.withOpacity(0.75),
                                ),
                                Text(
                                  '22 km/hr',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor
                                            .withOpacity(0.75),
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Row(
                              children: [
                                Icon(
                                  PhosphorIcons.identificationCard,
                                  size: 18,
                                  color: AppColors.whiteColor.withOpacity(0.75),
                                ),
                                Text(
                                  'BA 1 KHA 8237',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.whiteColor
                                            .withOpacity(0.75),
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          DateTimePicker(
            enabled: false,
            type: DateTimePickerType.dateTime,
            dateMask: 'd MMM, yyyy hh:mm a',
            initialValue: DateTime.now().toString(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            icon: const Icon(PhosphorIcons.bus),
            dateLabelText: 'Estimated time of arrival of bus',
            timeLabelText: "Hour",
            selectableDayPredicate: (date) {
              // Disable weekend days to select from the calendar
              if (date.weekday == 6 || date.weekday == 7) {
                return false;
              }

              return true;
            },
            onChanged: (val) {},
            validator: (val) {
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(PhosphorIcons.clock),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Duration',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: AppColors.whiteColor.withOpacity(0.6),
                            ),
                      ),
                      Text(
                        '2 hours',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: AppColors.whiteColor.withOpacity(0.6),
                            ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(PhosphorIcons.tag),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: AppColors.whiteColor.withOpacity(0.6),
                            ),
                      ),
                      Text(
                        'Rs.64',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: AppColors.whiteColor.withOpacity(0.6),
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  JustTheTooltip(
                    preferredDirection: AxisDirection.up,
                    showDuration: const Duration(seconds: 100),
                    content: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      width: 200,
                      color: AppColors.backgroundColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Calculation',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Fare Rate: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color:
                                          AppColors.whiteColor.withOpacity(0.5),
                                    ),
                              ),
                              const Text('Rs.800'),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Service Charge: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color:
                                          AppColors.whiteColor.withOpacity(0.5),
                                    ),
                              ),
                              const Text('Rs.800'),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Discount: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color:
                                          AppColors.whiteColor.withOpacity(0.5),
                                    ),
                              ),
                              const Text('Rs.800'),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Total Rate: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      color:
                                          AppColors.whiteColor.withOpacity(0.5),
                                    ),
                              ),
                              const Text('Rs.800'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    child: const Icon(
                      FeatherIcons.info,
                      size: 18,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(PhosphorIcons.ruler),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Distance',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: AppColors.whiteColor.withOpacity(0.6),
                            ),
                      ),
                      Text(
                        '2.3 KM',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: AppColors.whiteColor.withOpacity(0.6),
                            ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          SizedBox(
            height: 35.h,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              child: Text(
                'CONFIRM TRIP',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
