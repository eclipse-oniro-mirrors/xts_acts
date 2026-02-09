/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import avSession from '@ohos.multimedia.avsession';

export default function abilityTest() {
  describe('AVSessionEnum', () => {
    let TAG: string = "[AVSessionEnum]";
    
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0100
     * @tc.desc   Testing DecoderType: video/avc enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let decoderType = avSession.DecoderType.OH_AVCODEC_MIMETYPE_VIDEO_AVC;
        if (decoderType == "video/avc") {
          console.info(`DecoderType_video/avc enum :${decoderType}`);
        } else {
          console.info(`DecoderType_video/avc enum :${decoderType}`);
          expect(false).assertTrue();
        }
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0200
     * @tc.desc   Testing DecoderType: video/hevc enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let decoderType = avSession.DecoderType.OH_AVCODEC_MIMETYPE_VIDEO_HEVC;
        if (decoderType == "video/hevc") {
          console.info(`DecoderType_video/hevc enum :${decoderType}`);
        } else {
          console.info(`DecoderType_video/hevc enum :${decoderType}`);
          expect(false).assertTrue();
        }
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0300
     * @tc.desc   Testing DecoderType: audio/av3a enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_DECODERTYPE_ENUM_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        let decoderType = avSession.DecoderType.OH_AVCODEC_MIMETYPE_AUDIO_VIVID;
        if (decoderType == "audio/av3a") {
          console.info(`DecoderType_audio/av3a enum :${decoderType}`);
        } else {
          console.info(`DecoderType_audio/av3a enum :${decoderType}`);
          expect(false).assertTrue();
        }
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_RESOLUTION_ENUM_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_RESOLUTION_ENUM_0100
     * @tc.desc   compare all value in ResolutionLevel to number value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_RESOLUTION_ENUM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
        console.info(`TestLog: RESOLUTION_480P is ${avSession.ResolutionLevel.RESOLUTION_480P}`);
        expect(avSession.ResolutionLevel.RESOLUTION_480P).assertEqual(0 as avSession.ResolutionLevel);
        console.info(`TestLog: RESOLUTION_720P is ${avSession.ResolutionLevel.RESOLUTION_720P}`);
        expect(avSession.ResolutionLevel.RESOLUTION_720P).assertEqual(1 as avSession.ResolutionLevel);
        console.info(`TestLog: RESOLUTION_1080P is ${avSession.ResolutionLevel.RESOLUTION_1080P}`);
        expect(avSession.ResolutionLevel.RESOLUTION_1080P).assertEqual(2 as avSession.ResolutionLevel);
        console.info(`TestLog: RESOLUTION_2K is ${avSession.ResolutionLevel.RESOLUTION_2K}`);
        expect(avSession.ResolutionLevel.RESOLUTION_2K).assertEqual(3 as avSession.ResolutionLevel);
        console.info(`TestLog: RESOLUTION_4K is ${avSession.ResolutionLevel.RESOLUTION_4K}`);
        expect(avSession.ResolutionLevel.RESOLUTION_4K).assertEqual(4 as avSession.ResolutionLevel);
        done();
    })


    /**
     * @tc.number      SUB_MULTIMEDIA_AVSESSION_RESOLUTION_LEVEL_ENUM_0100
     * @tc.name        SUB_MULTIMEDIA_AVSESSION_RESOLUTION_LEVEL_ENUM_0100
     * @tc.desc        compare all value in ResolutionLevel to number value
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_RESOLUTION_LEVEL_ENUM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      console.info(`TestLog: RESOLUTION_480P is ${avSession.ResolutionLevel.RESOLUTION_480P}`);
      expect(avSession.ResolutionLevel.RESOLUTION_480P).assertEqual(0 as avSession.ResolutionLevel);
      console.info(`TestLog: RESOLUTION_720P is ${avSession.ResolutionLevel.RESOLUTION_720P}`);
      expect(avSession.ResolutionLevel.RESOLUTION_720P).assertEqual(1 as avSession.ResolutionLevel);
      console.info(`TestLog: RESOLUTION_1080P is ${avSession.ResolutionLevel.RESOLUTION_1080P}`);
      expect(avSession.ResolutionLevel.RESOLUTION_1080P).assertEqual(2 as avSession.ResolutionLevel);
      console.info(`TestLog: RESOLUTION_2K is ${avSession.ResolutionLevel.RESOLUTION_2K}`);
      expect(avSession.ResolutionLevel.RESOLUTION_2K).assertEqual(3 as avSession.ResolutionLevel);
      console.info(`TestLog: RESOLUTION_4K is ${avSession.ResolutionLevel.RESOLUTION_4K}`);
      expect(avSession.ResolutionLevel.RESOLUTION_4K).assertEqual(4 as avSession.ResolutionLevel);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_CASTCONTROLCOMMAND_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_CASTCONTROLCOMMAND_0100
     * @tc.desc   compare all value in ControlCommand to number value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_CASTCONTROLCOMMAND_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done: Function) => {
      try{
        let avCommand: avSession.AVCastControlCommand = {command:'seek',parameter: 15};
        console.info(`ControlCommand successfully ${JSON.stringify(avCommand)}`);
      } catch(err){
        expect(false).assertTrue();
        console.error(`ControlCommand BusinessError: code: ${err.code}, message: ${err.message}`);
      };
        done();
    })



  })
}





