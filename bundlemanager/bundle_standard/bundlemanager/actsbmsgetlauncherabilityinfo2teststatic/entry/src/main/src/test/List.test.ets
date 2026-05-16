import actsGetLauncherAbilityInfo2Test from './GetLauncherAbilityInfo.test'
import getApplicationLabel from './GetApplicationLabel.test'
import GetInstalledBundleList from './GetInstalledBundleList.test'
export default function testsuite() {
  actsGetLauncherAbilityInfo2Test();
  getApplicationLabel();
  GetInstalledBundleList();
}