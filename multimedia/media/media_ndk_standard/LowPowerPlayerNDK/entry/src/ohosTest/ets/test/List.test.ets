import {CanIUseLPPTest, executeLowPowerAVSink} from './CanIUseLPPTest.test';
import OhLPPAudioNDKTest from './OhLPPAudioNDKTest.test';
import OhLPPVideoNDKTest from './OhLPPVideoNDKTest.test';
import OhLPPMp4NDKTest from './OhLPPMp4NDKTest.test';
let isExecute = executeLowPowerAVSink();
export default function testsuite() {
  CanIUseLPPTest();
  if (isExecute) {
    OhLPPAudioNDKTest();
    OhLPPVideoNDKTest();
    OhLPPMp4NDKTest();
  }
}