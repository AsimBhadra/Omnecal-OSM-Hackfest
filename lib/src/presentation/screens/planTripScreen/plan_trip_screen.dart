part of screens;

class PlanTripScreen extends StatefulWidget {
  const PlanTripScreen({Key? key}) : super(key: key);

  @override
  State<PlanTripScreen> createState() => _PlanTripScreenState();
}

class _PlanTripScreenState extends State<PlanTripScreen>
    with TickerProviderStateMixin {
  final FocusNode destinationFocusNode = FocusNode();
  final FocusNode fromFocusNode = FocusNode();

  final TextEditingController destinationController = TextEditingController();
  final TextEditingController fromController = TextEditingController();

  final PanelController _pc = PanelController();

  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getLocation();
    });
    var keyboardVisibilityController = KeyboardVisibilityController();

    // Subscribe
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible) {
        _pc.open();
      } else {
        _pc.close();
      }
    });
  }

  _getLocation() async {
    String location = await (LocationService().getUserLocation());
    setState(() {
      fromController.text = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan your Trip'),
      ),
      body: SlidingUpPanel(
        controller: _pc,
        color: Colors.transparent,
        body: const MapWidget(),
        panel: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 23,
          ),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.sp),
              topRight: Radius.circular(30.sp),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              CustomTextField(
                hintText: 'Where to?',
                iconData: FeatherIcons.mapPin,
                focusNode: destinationFocusNode,
                textEditingController: destinationController,
                validator: (String? value) {
                  if (value!.isEmpty) return 'Please enter username or email';
                  return null;
                },
              ),
              CustomTextField(
                hintText: 'Where from?',
                iconData: FeatherIcons.mapPin,
                focusNode: fromFocusNode,
                textEditingController: fromController,
                validator: (String? value) {
                  if (value!.isEmpty) return 'Please enter username or email';
                  return null;
                },
              ),
              Text(
                'Depature Date and Time',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.whiteColor.withOpacity(0.6),
                    ),
              ),
              DateTimePicker(
                type: DateTimePickerType.dateTime,
                dateMask: 'd MMM, yyyy hh:mm a',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: const Icon(FeatherIcons.calendar),
                dateLabelText: 'Date',
                timeLabelText: "Hour",
                selectableDayPredicate: (date) {
                  // Disable weekend days to select from the calendar
                  if (date.weekday == 6 || date.weekday == 7) {
                    return false;
                  }

                  return true;
                },
                onChanged: (val) {
                  _pc.open();
                },
                validator: (val) {
                  return null;
                },
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(
                height: 35.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TripPlannerScreen(
                          to: destinationController.text,
                          from: fromController.text,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'PLAN MY TRIP',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        minHeight: 150,
        maxHeight: 420,
        collapsed: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 23,
          ),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.sp),
              topRight: Radius.circular(30.sp),
            ),
          ),
          child: CustomTextField(
            hintText: 'Where to?',
            iconData: FeatherIcons.mapPin,
            focusNode: destinationFocusNode,
            textEditingController: destinationController,
            validator: (String? value) {
              if (value!.isEmpty) return 'Please enter username or email';
              return null;
            },
          ),
        ),
      ),
    );
  }
}

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: LocationService().getUserLatLong(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          LatLng currentPosition = snapshot.data as LatLng;
          return FlutterMap(
            options: MapOptions(
              center: currentPosition,
              zoom: 15.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/asimbhadra/cl4o5ig5h000y15oc7m5e74oz/tiles/256/{z}/{x}/{y}@2x?access_token={access_token}",
                additionalOptions: {
                  "access_token":
                      "pk.eyJ1IjoiYXNpbWJoYWRyYSIsImEiOiJjbDRvNWVrZnAwNGNpM2pxaWUwc2lrajd3In0.A_bRukNRijzg91try1xYWg"
                },
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    point: currentPosition,
                    builder: (ctx) => Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2.0,
                          color: AppColors.mainSwatch,
                        ),
                      ),
                      child: const Icon(
                        Icons.circle,
                        color: AppColors.mainSwatch,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            nonRotatedChildren: [
              AttributionWidget.defaultWidget(
                source: 'OpenStreetMap contributors',
                onSourceTapped: () {},
              ),
            ],
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
