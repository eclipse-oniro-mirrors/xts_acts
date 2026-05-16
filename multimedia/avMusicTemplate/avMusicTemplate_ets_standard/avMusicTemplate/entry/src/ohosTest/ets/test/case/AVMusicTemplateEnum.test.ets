/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import avMusicTemplate from '@ohos.multimedia.avMusicTemplate';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { AVMusicTemplateUtil } from '../utils/AVMusicTemplateUtil.test';
import { CommonUtils } from '../utils/CommonUtil.test';
import { FakerDataUtil } from '../utils/FakerDataUtil.test';
import { CommonConstants } from '../constants/CommonConstants.test';

const TAG = 'avMusicTemplateEnumTest';

export default function avMusicTemplateEnumTest() {
  describe('ActsAVMusicTemplateEnumTest', () => {

    beforeAll(async () => {
      CommonUtils.logInfo(TAG, `Start testing avMusicTemplate interfaces`);
    })
    beforeEach(async () => {
    })
    afterEach(async () => {
    })
    afterAll(async () => {
      CommonUtils.logInfo(TAG, `End testing avMusicTemplate interfaces`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0001
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0001
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.SettingType?.SWITCH).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0001 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0002
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0002
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.SettingType?.LIST).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0002 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0003
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0003
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.SettingType?.JUMP).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0003 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0004
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0004
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.DialogType?.NORMAL).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0004 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0005
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0005
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.DialogType?.INTERNET).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0005 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0006
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0006
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.DialogType?.FLOW).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0006 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0007
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0007
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.DialogType?.PAID).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0007 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0008
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0008
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.DialogType?.VIP).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0008 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0009
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0009
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.DialogType?.LOGIN).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0009 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0010
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0010
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.DialogType?.ERROR).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0010 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0011
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0011
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.DialogType?.UNKNOWN).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0011 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0012
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0012
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.ButtonType?.NORMAL).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0012 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0013
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0013
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.ButtonType?.EMPHASIZE).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0013 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0014
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0014
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.EntityType?.UNKNOWN).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0014 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0015
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0015
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.EntityType?.SINGLE).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0015 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0016
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0016
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.EntityType?.SINGER).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0016 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0017
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0017
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.EntityType?.ALBUM).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0017 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0018
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0018
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.EntityType?.RANKING).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0018 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0019
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0019
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.EntityType?.BANNER).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0019 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0020
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0020
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.EntityType?.RADIO_STATION).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0020 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0021
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0021
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.PlaybackState?.PLAYBACK_STATE_PREPARE).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0021 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0022
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0022
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.PlaybackState?.PLAYBACK_STATE_PLAY).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0022 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0023
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0023
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.PlaybackState?.PLAYBACK_STATE_PAUSE).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0023 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0024
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0024
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.PlaybackState?.PLAYBACK_STATE_STOP).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0024 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0025
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0025
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.PlaybackState?.PLAYBACK_STATE_COMPLETED).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0025 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0026
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0026
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.PlaybackState?.PLAYBACK_STATE_ERROR).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0026 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0027
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0027
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.PlaybackState?.PLAYBACK_STATE_BUFFERING).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0027 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0028
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0028
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.MemberPurchaseType?.NORMAL).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0028 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0029
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0029
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.MemberPurchaseType?.BANNER).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0029 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0030
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0030
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.AVMusicTemplateType?.DEFAULT).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0030 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0031
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0031
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.SearchPlayInfoType?.PLAY_MUSIC).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0031 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0032
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0032
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.SearchPlayInfoType?.PLAY_VIDEO).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0032 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0033
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0033
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.SearchPlayInfoType?.PLAY_VIDEO).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0033 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0034
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0034
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.Sort?.NONE).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0034 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0035
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0035
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.Sort?.ORDER).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0035 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0036
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0036
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.Sort?.REVERSE_ORDER).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0036 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0037
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0037
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.AVMusicTemplateErrorCode?.ERR_CODE_CREATE_AV_MUSIC_TEMPLATE_FAILED)
            .assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0037 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0038
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0038
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.AVMusicTemplateErrorCode?.ERR_CODE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_FAILED)
            .assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0038 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0039
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0039
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.AVMusicTemplateErrorCode?.ERR_CODE_TEMPLATE_LISTENER_NO_EXIT).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0039 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0040
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0040
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.AVMusicTemplateErrorCode?.ERR_CODE_CONTROLLER_CALLBACK_NO_EXIT).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0040 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0041
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0041
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.AVMusicTemplateErrorCode?.ERR_CODE_AV_MUSIC_TEMPLATE_NOT_EXIST).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0041 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0042
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0042
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.AVMusicTemplateErrorCode?.ERR_CODE_CONTROLLER_NOT_EXIST).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0042 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0043
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0043
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.AVMusicTemplateErrorCode?.ERR_CODE_CONTROLLER_IS_EXIST).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0043 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0044
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0044
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.AVMusicTemplateErrorCode?.ERR_CODE_SERVICE_NOT_EXIST).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0044 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0045
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0045
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.AVMusicTemplateErrorCode?.ERR_CODE_SERVICE_EXCEPTION).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0045 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0046
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0046
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.AVMusicTemplateErrorCode?.ERR_CODE_EXCEED_MAX_DATA_SIZE).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0046 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0047
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0047
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.AVMusicTemplateErrorCode?.ERR_CODE_WRITE_RESULT_EXCEPTION).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0047 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0048
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0048
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.AVMusicTemplateErrorCode?.ERR_CODE_AV_MUSIC_TEMPLATE_ERROR).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0048 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0049
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0049
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.DownloadStatus?.DOWNLOAD_SUCCESS).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0049 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0050
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0050
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.DownloadStatus?.DOWNLOADING).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0050 catch err: " + err);
        }
      })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0051
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0051
     * @tc.desc   Testing av music template enum data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_ENUM_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          expect(avMusicTemplate.DownloadStatus?.DOWNLOAD_FAIL).assertEqual(undefined);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_ENUM_0051 catch err: " + err);
        }
      })
  })
}