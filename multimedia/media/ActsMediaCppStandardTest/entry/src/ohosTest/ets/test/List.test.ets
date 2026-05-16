import ActsAudioDecEncNdkTest from './ActsAudioDecEncNdkTest.test';
import ActsCodecFormatNdkTest from './ActsCodecFormatNdkTest.test';
import ActsVideoDecEncNdkTest from './ActsVideoDecEncNdkTest.test';

export default function testsuite() {
  ActsAudioDecEncNdkTest();
  ActsCodecFormatNdkTest();
  ActsVideoDecEncNdkTest();
}
