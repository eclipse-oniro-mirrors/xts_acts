import GetBundleInfoForSelf from "./GetBundleInfoForSelf.test";
import GetBundleInfo from "./GetBundleInfo.test";
import abilityTest from "./GetLauncherAbilityInfostatic.test";


export default function testsuite() {
  GetBundleInfoForSelf();
  GetBundleInfo();
  abilityTest();
}
