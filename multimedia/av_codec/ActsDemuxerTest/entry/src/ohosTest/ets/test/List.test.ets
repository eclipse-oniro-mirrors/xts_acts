
import DemuxerApiTest from './DemuxerApiTest.test';
import DemuxerFuncTest from './DemuxerFuncTest.test';
import DemuxerFunc2Test from './DemuxerFunc2Test.test';
import DemuxerProcTest from './DemuxerProcTest.test';

export default function testsuite() {
  DemuxerApiTest();
  DemuxerFuncTest();
  DemuxerFunc2Test();
  DemuxerProcTest();
}
