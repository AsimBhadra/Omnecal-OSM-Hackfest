part of screens;

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const WhatsNewWidget(),
          Destinations(),
          const PlanTripWidget(),
        ],
      ),
    );
  }
}

class WhatsNewWidget extends StatelessWidget {
  const WhatsNewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20.sp),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What\'s New?',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New User Offer!',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.sp,
                        ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    width: 195.w,
                    child: Text(
                      'First user will get 25% discount\non fare for first 5 trips.\nLet\'s get started.',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              SvgPicture.asset(
                'assets/images/map.svg',
                width: 95,
                height: 80,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Destinations extends StatelessWidget {
  Destinations({Key? key}) : super(key: key);
  final List<Map> destinations = [
    {
      'name': 'Chandragiri Hills',
      'distance': '20 Km',
      'departureTime': '5:30 AM',
      'departureDate': '3rd Bhadra 2079',
      'price': 'NPR 120',
      'time': '3 hours',
      'busTime': '5:45 AM',
      'busDate': '3rd Bhadra 2079',
      'image':
          'https://media.tacdn.com/media/attractions-splice-spp-674x446/06/74/08/d6.jpg',
    },
    {
      'name': 'Pashupatinath Temple',
      'distance': '10 Km',
      'departureTime': '7:30 AM',
      'departureDate': '5th Bhadra 2079',
      'price': 'NPR 70',
      'time': '1 hour',
      'busTime': '8:00 AM',
      'busDate': '5th Bhadra 2079',
      'image':
          'https://bsmedia.business-standard.com/_media/bs/img/article/2020-06/16/full/1592304513-3729.jpg',
    },
    {
      'name': 'Swyambunath Temple',
      'distance': '10 Km',
      'departureTime': '7:30 AM',
      'departureDate': '5th Bhadra 2079',
      'price': 'NPR 70',
      'time': '1 hour',
      'busTime': '8:00 AM',
      'busDate': '5th Bhadra 2079',
      'image':
          'https://waglestreetjournal.files.wordpress.com/2013/07/swoyambhu-stupa.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(PhosphorIcons.mapPin),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Destinations for you',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            padding:
                EdgeInsets.only(left: 15.w, top: 10.h, bottom: 0.h, right: 5.w),
            decoration: BoxDecoration(
              color: AppColors.whiteColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20.sp),
            ),
            child: SizedBox(
              height: 276.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  Map data = destinations[index];
                  return DestinationCard(
                    data: data,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  const DestinationCard({Key? key, required this.data}) : super(key: key);
  final Map data;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12.w),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 110.h,
                width: 150.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.sp),
                    topRight: Radius.circular(20.sp),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      data['image'],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 150.w,
                height: 155.h,
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 10.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor.withOpacity(0.20),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.sp),
                    bottomRight: Radius.circular(20.sp),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 16.sp,
                          ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          PhosphorIcons.mapPin,
                          color: AppColors.whiteColor.withOpacity(0.75),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        SizedBox(
                          width: 100.w,
                          child: Text(
                            data['name'],
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 16.sp,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          PhosphorIcons.calendar,
                          color: AppColors.whiteColor.withOpacity(0.75),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Departure Date and Time',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 10.sp,
                                    color:
                                        AppColors.whiteColor.withOpacity(0.5),
                                  ),
                            ),
                            SizedBox(
                              width: 100.w,
                              child: Text(
                                data['departureDate'] +
                                    ' at ' +
                                    data['departureTime'],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 12.sp,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              PhosphorIcons.clock,
                              color: AppColors.whiteColor.withOpacity(0.75),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Time',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 10.sp,
                                        color: AppColors.whiteColor
                                            .withOpacity(0.5),
                                      ),
                                ),
                                SizedBox(
                                  child: Text(
                                    data['time'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 12.sp,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Row(
                          children: [
                            Icon(
                              PhosphorIcons.tag,
                              color: AppColors.whiteColor.withOpacity(0.75),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 10.sp,
                                        color: AppColors.whiteColor
                                            .withOpacity(0.5),
                                      ),
                                ),
                                SizedBox(
                                  child: Text(
                                    data['price'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 12.sp,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          PhosphorIcons.calendar,
                          color: AppColors.whiteColor.withOpacity(0.75),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Time of Bus and Bus stop',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 10.sp,
                                    color:
                                        AppColors.whiteColor.withOpacity(0.5),
                                  ),
                            ),
                            SizedBox(
                              width: 100.w,
                              child: Text(
                                data['busDate'] + ' at ' + data['busTime'],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 12.sp,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 100.h,
            right: 10.w,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.backgroundColor.withOpacity(0.8),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  FeatherIcons.bookmark,
                  color: AppColors.greenColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanTripWidget extends StatelessWidget {
  const PlanTripWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20.sp),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Plan your trip',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text('View, Analyze and Decide',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: AppColors.whiteColor.withOpacity(0.5),
                          )),
                ],
              ),
              SizedBox(width: 14.w),
              Container(
                height: 70.h,
                width: 140.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.sp),
                    topRight: Radius.circular(20.sp),
                  ),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/bus.png',
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          SizedBox(
            height: 35.h,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.router.pushNamed('/plan-trip-screen');
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              child: Text(
                'GET STARTED',
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
