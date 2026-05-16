import abilityTest from './Ability.test';
import hiddebughiperfTest from './HiDebugHiperf.test';
import HidebugTest from './HiDeBugUn.test';
import ActsHiDebugHiProfilerTest from './HiDebugHiProfiler.test';
import HiDeBugTrace from './HiDeBugTrace.test';

export default function testsuite() {
  abilityTest();
  hiddebughiperfTest();
  HidebugTest();
  ActsHiDebugHiProfilerTest();
  HiDeBugTrace();
}
