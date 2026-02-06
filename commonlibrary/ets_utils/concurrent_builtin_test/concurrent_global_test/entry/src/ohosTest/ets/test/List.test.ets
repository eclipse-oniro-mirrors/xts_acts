import abilityTest from './Ability.test';
import globalTest from './ConcurrentGlobalTest.test'

export default function testsuite() {
  abilityTest();
  globalTest();
}