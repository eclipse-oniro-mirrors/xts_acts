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
//import avmetadata_builder from 'libentry.so';
import AVSessionManager from '@ohos.multimedia.avsession';
import avSes from 'libentry.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';


export default function builderAbilityTest() {
  describe('builderAbilityTest', () => {


    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
    * @tc.number     : SUB_MULTIMEIDA_AVSESSION_NDK_CREAT_0100
    * @tc.name       : CreateAVSessionTest001
    * @tc.desc       : Create NDKAVSession.
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('SUB_MULTIMEIDA_AVSESSION_NDK_CREAT_0100', 2, async (done: Function) => {
      console.info("test SetPlaybackState ---------------");
      let ret = avSes.runTest('CreateAVSessionTest', [1, '123', '456', '789']);
      expect(ret).assertEqual(0);
      ret = avSes.runTest('CreateAVSessionTest', [3, '1xxx', 'xxxx', 'xxx']);
      expect(ret).assertEqual(0);
      done();
    })

    /**
    * @tc.number     : SUB_MULTIMEIDA_AVSESSION_NDK_SETPLAYBACKSTAGE_0100
    * @tc.name       : SetPlaybackState001
    * @tc.desc       : NDKAVSession SetPlaybackState.
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('SUB_MULTIMEIDA_AVSESSION_NDK_SETPLAYBACKSTAGE_0100', 2, async (done: Function) => {
      console.info("test SetPlaybackState ---------------");
      let ret = avSes.runTest('SetPlaybackState', [1]);
      expect(ret).assertEqual(0);
      done();
    })

    /**
    * @tc.number     : SUB_MULTIMEIDA_AVSESSION_NDK_SETLOOPMODE_0100
    * @tc.name       : SetLoopMode
    * @tc.desc       : NDKAVSession SetLoopMode.
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('SUB_MULTIMEIDA_AVSESSION_NDK_SETLOOPMODE_0100', 2, async (done: Function) => {
      console.info("test SetLoopMode ---------------");
      let ret = avSes.runTest('SetLoopMode', [0]);
      expect(ret).assertEqual(0);
      done();
    })

    /**
    * @tc.number     : SUB_MULTIMEIDA_AVSESSION_NDK_SETPLAYBACKPOSITION_0100
    * @tc.name       : SetPlaybackPosition
    * @tc.desc       : NDKAVSession SetPlaybackPosition.
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('SUB_MULTIMEIDA_AVSESSION_NDK_SETPLAYBACKPOSITION_0100', 2, async (done: Function) => {
      console.info("test SetPlaybackPosition ---------------");
      let ret = avSes.runTest('SetPlaybackPosition', [123, 456]);
      expect(ret).assertEqual(0);
      done();
    })

    /**
    * @tc.number     : SUB_MULTIMEIDA_AVSESSION_NDK_SETAVMETADATA_0100
    * @tc.name       : SetAVMetaData
    * @tc.desc       : NDKAVSession SetAVMetaData.
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('SUB_MULTIMEIDA_AVSESSION_NDK_SETAVMETADATA_0100', 0, async (done: Function) => {
      console.info("test SetAVMetaData ---------------");
      let ret = avSes.runTest('SetAVMetaData', ['title', 'artist', 'author', 'album', 'writer',
        'composer', 'mediaImageUri', 'subtitle', 'description', 'lyric', 'assetId', 30, 1, 4000]);
      expect(ret).assertEqual(0);
      done();
    })

    /**
    * @tc.number     : SUB_MULTIMEIDA_AVSESSION_NDK_TestAllPara_0100
    * @tc.name       : setBuilderTitle
    * @tc.desc       : NDKAVSession setBuilderTitle.
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('SUB_MULTIMEIDA_AVSESSION_NDK_TESTAllPARA_0100', 0, async (done: Function) => {
      console.info("test setBuilderTitle ---------------");
      let ret = avSes.runTest('TestAll', [1, 'sessionTag', 'sessionTag', 'abilityName',
        'title', 'artist', 'author', 'album', 'writer', 'composer', 'mediaImageUri',
        'subtitle', 'description', 'lyric', 'assetId',
        30, 1, 1, 1, true, 1, 1, 2]);
      expect(ret).assertEqual(0);
      done();
    })

    /**
    * @tc.number     : SUB_MULTIMEIDA_AVSESSION_NDK_ACTIVATE_0100
    * @tc.name       : OHAVSessionActivate
    * @tc.desc       : NDKAVSession OHAVSessionActivate.
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it("SUB_MULTIMEIDA_AVSESSION_NDK_ACTIVATE_0100", 2, async (done: Function) => {
      try {
        console.info("test OHAVSessionActivate ---------------");
        let ret:number = await avSes.AVSessionActivate();
        expect(ret).assertEqual(0);
      } catch (error) {
        expect(false).assertEqual(true);
      }
      done();
    })

    /**
    * @tc.number     : SUB_MULTIMEIDA_AVSESSION_NDK_DEACTIVATE_0100
    * @tc.name       : OHAVSessionDeactivate
    * @tc.desc       : NDKAVSession OHAVSessionDeactivate.
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it("SUB_MULTIMEIDA_AVSESSION_NDK_DEACTIVATE_0100", 2, async (done: Function) => {
      try {
        console.info("test OHAVSessionDeactivate ---------------");
        let ret:number = await avSes.AVSessionDeActivate();
        expect(ret).assertEqual(0);
      } catch (error) {
        expect(false).assertEqual(true);
      }
      done();
    })

    /**
    * @tc.number     : SUB_MULTIMEIDA_AVSESSION_NDK_GETSESSIONID_0100
    * @tc.name       : AVSessionGetSessionId
    * @tc.desc       : NDKAVSession AVSessionGetSessionId.
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it("SUB_MULTIMEIDA_AVSESSION_NDK_GETSESSIONID_0100", 2, async (done: Function) => {
      try {
        console.info("test AVSessionGetSessionId ---------------");
        let ret:number = await avSes.AVSessionGetSessionId();
        expect(ret).assertEqual(0);
      } catch (error) {
        expect(false).assertEqual(true);
      }
      done();
    })

    /**
    * @tc.number     : SUB_MULTIMEIDA_AVSESSION_NDK_GETSESSIONTYPE_0100
    * @tc.name       : AVSessionGetSessionType
    * @tc.desc       : NDKAVSession AVSessionGetSessionType.
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it("SUB_MULTIMEIDA_AVSESSION_NDK_GETSESSIONTYPE_0100", 2, async (done: Function) => {
      try {
        console.info("test AVSessionGetSessionType ---------------");
        let ret:number = await avSes.AVSessionGetSessionType();
        expect(ret).assertEqual(0);
      } catch (error) {
        expect(false).assertEqual(true);
      }
      done();
    })
  })
}