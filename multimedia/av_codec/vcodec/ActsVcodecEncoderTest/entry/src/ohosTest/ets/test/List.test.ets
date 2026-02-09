import VideoEncoderApiTest from './VideoEncoderApiTest.test';
import VideoEncoderConfigureTest from './VideoEncoderConfigureTest.test';
import VideoEncoderGetparamTest from './VideoEncoderGetparamTest.test';
import VideoEncoderStateTest from './VideoEncoderStateTest.test';
import VideoEncoderTemporalTest from './VideoEncoderTemporalTest.test';
import VideoEncoderFunc2Test from './VideoEncoderFunc2Test.test';
import VideoEncoderFuncTest from './VideoEncoderFuncTest.test';
import VideoEncoderFuncTest2 from './VideoEncoderFuncTest2.test';
import VideoEncoderSetparamTest from './VideoEncoderSetparamTest.test';

export default function testsuite() {
  VideoEncoderApiTest();
  VideoEncoderConfigureTest();
  VideoEncoderGetparamTest();
  VideoEncoderStateTest();
  VideoEncoderTemporalTest();
  VideoEncoderFunc2Test();
  VideoEncoderFuncTest();
  VideoEncoderFuncTest2();
  VideoEncoderSetparamTest();
}