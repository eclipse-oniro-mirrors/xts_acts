import abilityTest from './Ability.test';
import huksApiTest from './HuksApi.test';
import huksErrorTest from './HuksError.test';

export default function testsuite() {
  if (canIUse("SystemCapability.Security.Huks.CryptoExtension")) {
    huksApiTest();
    huksErrorTest();
  } else {
    abilityTest();
  }
}