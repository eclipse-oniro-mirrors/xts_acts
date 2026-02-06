/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Level, Size } from '@ohos/hypium';
import pcsNetworkTest from 'libpcsNetworkTest.so'
import pcsAudioTest from 'libpcsAudioTest.so'
import softwareNdk from 'libsoftwareNdk.so'
import openglNdk from 'libopenglNdk.so'
import { BusinessError } from '@ohos.base';

export default function pcsNdkTest() {
  describe('PCSNdkTest', () => {
    let SuccessResult1 = 0
    let SuccessResult2 = 1
    /**
     * @tc.name   testSocketApi0100
     * @tc.number G-HARDWARE-0200
     * @tc.desc   【G-HARDWARE-0200】必须支持 IPV4 协议栈,必须提供 Linux BSD Socket API 或者 LWIP BSD Socket API 之一
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSocketApi0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let recvParam = 0
      expect(pcsNetworkTest.Socket()).assertLarger(SuccessResult1);
      expect(pcsNetworkTest.Connect()).assertEqual(SuccessResult1);
      expect(pcsNetworkTest.Bind()).assertEqual(SuccessResult1);
      expect(pcsNetworkTest.Listen()).assertEqual(SuccessResult1)
      expect(pcsNetworkTest.Send()).assertLarger(SuccessResult1);
      expect(pcsNetworkTest.Recv(recvParam)).assertEqual(SuccessResult2);
      done()
    });

    /**
     * @tc.name   testC99Standard0100
     * @tc.number G-SOFTWARE-0300
     * @tc.desc   【G-SOFTWARE-0300】C 运行时的 API 必须遵循 C99 standard、POSIX.1.2008 规范。
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testC99Standard0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let index0 = 0
      let index1 = 1
      let initArray0Result = 1
      let initArray1Result = 0
      let boolArray0Result = 0
      let boolArray1Result = 1
      let initArray = softwareNdk.InitArray()
      expect(initArray[index0]).assertEqual(initArray0Result)
      expect(initArray[index1]).assertEqual(initArray1Result)
      let bools = softwareNdk.GetBool()
      expect(bools[index0]).assertEqual(boolArray0Result)
      expect(bools[index1]).assertEqual(boolArray1Result)
      done()
    })

    /**
     * @tc.name   testAudioDecoding0100
     * @tc.number C-S|STD-SOFTWARE-0804
     * @tc.desc   【C-S|STD-SOFTWARE-0804】必须支持 MP3 格式解码, 支持单/双声道，
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAudioDecoding0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(pcsAudioTest.OH_AudioCodec_Flush_First()).assertEqual(SuccessResult1);
      expect(pcsAudioTest.OH_AudioCodec_Flush_Second()).assertEqual(SuccessResult1);
      done();
    });

    /**
     * @tc.name   testAudioEncoderFlac
     * @tc.number C-S|STD-SOFTWARE-0700
     * @tc.desc   【C-S|STD-SOFTWARE-0700】必须支持PCM/WAV、FLAC、OGG格式的音频编码,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAudioEncoderFlac', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(pcsAudioTest.OH_AudioEncoderFlac()).assertEqual(SuccessResult1);
      done();
    });

    /**
     * @tc.name   testAudioEncoderAAc
     * @tc.number C-S|STD-SOFTWARE-0701
     * @tc.desc   【C-S|STD-SOFTWARE-0701】必须支持MMEG-2 AAC Main/MPEG-2 AAC LC(Low  Complexity)，
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAudioEncoderAAc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(pcsAudioTest.OH_AudioEncoderAAc()).assertEqual(SuccessResult1);
      done();
    });

    /**
     * @tc.name   testAudioDecoderAAc
     * @tc.number C-STD-SOFTWARE-0702
     * @tc.desc   【C-STD-SOFTWARE-0702】必须支持MPEG-4 AAC Profile(AAC LC)格式解码,支持单/双声道,支持
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAudioDecoderAAc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(pcsAudioTest.OH_AudioDecoderAAc()).assertEqual(SuccessResult1);
      done();
    });

    /**
     * @tc.name   testAudioEncoderH264
     * @tc.number C-STD-SOFTWARE-0703
     * @tc.desc   【C-STD-SOFTWARE-0703】必须支持H.264格式Baseline Profile Level3 编码格式, 必须支持SD(尺寸小于720x480)，
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAudioEncoderH264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(pcsAudioTest.OH_AudioEncoderH264()).assertEqual(SuccessResult1);
      done();
    });

    /**
     * @tc.name   testAudioDecoderH264
     * @tc.number C-STD-SOFTWARE-0704
     * @tc.desc   【C-STD-SOFTWARE-0704】必须支持H.264格式Baseline Profile/Main Profile/High Profile 解码，
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAudioDecoderH264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(pcsAudioTest.OH_AudioDecoderH264()).assertEqual(SuccessResult1);
      done();
    });


    /**
     * @tc.name   testHardwareAcceleration0100
     * @tc.number C-ALL-HARDWARE-0201
     * @tc.desc   【C-ALL-HARDWARE-0201】如果支持图形显示，并且支持图形的 2D 或 3D 硬件加速：默认情况下必须启用硬件加速。
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHardwareAcceleration0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let openglExist = openglNdk.OpenglExist()
        if(openglExist == 0) {
          expect(openglNdk.OpenglEnabled()).assertEqual(SuccessResult1)
        }
      } catch (error) {
        let err: BusinessError = error as BusinessError
        console.log(`the device not support opengl code: ${err.code}, msg: ${err.message}`)
      }
      done()
    })
  })
}
