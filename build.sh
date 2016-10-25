#
# Do the quick test
#

echo "Setting up atlas"
source $ATLAS_LOCAL_ROOT_BASE/user/atlasLocalSetup.sh

echo "Setting up the Base release"
rcSetup Base,$RELEASE

# Everything is checked out in the following locations by
# the build robot.
# Combination
# CalibrationResults
# TestPolicy
# cppunit

###########################

echo "Doing setup and build"
rc find_packages
rc compile

rc test_ut --package Combination

###########################
echo "Doing the actual fitting now"
cd CalibrationResults
rm -rf *.html
rm -rf *.tar.gz

# Always run from the CalibrationResults directory!!
source scripts/runall.sh
