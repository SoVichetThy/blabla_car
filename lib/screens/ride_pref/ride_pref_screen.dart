import 'package:flutter/material.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../service/ride_prefs_service.dart';
import '../../theme/theme.dart';

import 'widgets/ride_pref_form.dart';
import 'widgets/ride_pref_history_tile.dart';

const String blablaHomeImagePath = 'assets/images/blabla_home.png';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class RidePrefScreen extends StatefulWidget {
  const RidePrefScreen({super.key});

  @override
  State<RidePrefScreen> createState() => _RidePrefScreenState();
}

class _RidePrefScreenState extends State<RidePrefScreen> {
  onRidePrefSelected(RidePref ridePref) {
    // 1 - Navigate to the rides screen (with a buttom to top animation)
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1 - Background  Image
        BlaBackground(),
        // 2 - Foreground content
        SafeArea(
          child: Column(
            children: [
              SizedBox(height: 16),
              Text(
                "Your pick of rides\nat low price",
                style: BlaTextStyles.heading.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height:50),
              Container(
                margin: EdgeInsets.symmetric(horizontal: BlaSpacings.l),
                decoration: BoxDecoration(
                  color: Colors.white, // White background
                  borderRadius: BorderRadius.circular(16), // Rounded corners
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 2.1 Display the Form to input the ride preferences
                    RidePrefForm(
                      initRidePref: RidePrefService.currentRidePref,
                    ),
                    SizedBox(height: BlaSpacings.m),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true, // Fix ListView height issue
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: RidePrefService.ridePrefsHistory.length,
                  itemBuilder: (ctx, index) => RidePrefHistoryTile(
                    ridePref: RidePrefService.ridePrefsHistory[index],
                    onPressed: () => onRidePrefSelected(
                        RidePrefService.ridePrefsHistory[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BlaBackground extends StatelessWidget {
  const BlaBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Image.asset(
        blablaHomeImagePath,
        fit: BoxFit.cover, // Adjust image fit to cover the container
      ),
    );
  }
}