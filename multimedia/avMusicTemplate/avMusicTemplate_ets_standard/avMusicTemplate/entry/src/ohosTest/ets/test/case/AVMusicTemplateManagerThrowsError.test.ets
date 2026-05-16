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
import { CommonConstants } from '../constants/CommonConstants.test';
import { CommonUtils } from '../utils/CommonUtil.test';
import { BusinessError } from '@kit.BasicServicesKit';
import { ExceptionPrompt } from '@kit.ArkUI';

const TAG = 'avMusicTemplateManagerThrowsErrorTest';

function onAVMusicTemplateEvent(des: avMusicTemplate.AVMusicTemplateDescriptor) {

}

export default function avMusicTemplateManagerThrowsErrorTest() {
  describe('ActsAVMusicTemplateManagerThrowsErrorTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_THROWS_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_THROWS_ERROR_0100
     * @tc.desc   Testing create av music template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_THROWS_ERROR_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          avMusicTemplate.createAVMusicTemplate(CommonConstants.TEMPLATE_TYPE as avMusicTemplate.AVMusicTemplateType);
          done();
        } catch (err) {
          CommonUtils.logError(TAG,
            "CREATE_AV_MUSIC_TEMPLATE_THROWS_ERROR_0100 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_THROWS_ERROR_0101
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_THROWS_ERROR_0101
     * @tc.desc   Testing create av music template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_THROWS_ERROR_0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          avMusicTemplate.createAVMusicTemplate(CommonConstants.TEMPLATE_TYPE as avMusicTemplate.AVMusicTemplateType);
          done();
        } catch (err) {
          CommonUtils.logError(TAG,
            "CREATE_AV_MUSIC_TEMPLATE_THROWS_ERROR_0101 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000001).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_THROWS_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_THROWS_ERROR_0200
     * @tc.desc   Testing create av music template controller
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_THROWS_ERROR_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          avMusicTemplate.createAVMusicTemplateController('1234509');
          done();
        } catch (err) {
          CommonUtils.logError(TAG,
            "CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_THROWS_ERROR_0200 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_THROWS_ERROR_0201
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_THROWS_ERROR_0201
     * @tc.desc   Testing create av music template controller
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_THROWS_ERROR_0201',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          avMusicTemplate.createAVMusicTemplateController('aaaaa');
          done();
        } catch (err) {
          CommonUtils.logError(TAG,
            "CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_THROWS_ERROR_0201 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_THROWS_ERROR_0202
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_THROWS_ERROR_0202
     * @tc.desc   Testing create av music template controller
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_THROWS_ERROR_0202',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          avMusicTemplate.createAVMusicTemplateController('');
          done();
        } catch (err) {
          CommonUtils.logError(TAG,
            "CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_THROWS_ERROR_0202 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000002).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_THROWS_ERROR_0203
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_THROWS_ERROR_0203
     * @tc.desc   Testing create av music template controller
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_THROWS_ERROR_0203',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          avMusicTemplate.createAVMusicTemplateController('');
          done();
        } catch (err) {
          CommonUtils.logError(TAG,
            "CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_THROWS_ERROR_0203 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 35000005).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_THROWS_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_THROWS_ERROR_0300
     * @tc.desc   Testing get all av music template descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_THROWS_ERROR_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          avMusicTemplate.getAllAVMusicTemplateDescriptors(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG,
            "GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_THROWS_ERROR_0300 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_THROWS_ERROR_0301
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_THROWS_ERROR_0301
     * @tc.desc   Testing get all av music template descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_THROWS_ERROR_0301',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let res: avMusicTemplate.AVMusicTemplateDescriptor[] =
            avMusicTemplate.getAllAVMusicTemplateDescriptors(undefined);
          expect(res).not().assertUndefined();
          for (let i = 0; i < res.length; i++) {
            const element = res[i];
            expect(element).not().assertUndefined();
          }
          done();
        } catch (err) {
          CommonUtils.logError(TAG,
            "GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_THROWS_ERROR_0301 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0400
     * @tc.desc   Testing on av music template create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let event: Callback<avMusicTemplate.AVMusicTemplateDescriptor> | undefined =
            (des: avMusicTemplate.AVMusicTemplateDescriptor) => {
              CommonUtils.logInfo(TAG, `ON_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0400 des=${des}`);
            }
          avMusicTemplate.onAVMusicTemplateCreate(event);
          done();
        } catch (err) {
          CommonUtils.logError(TAG,
            "ON_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0400 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0401
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0401
     * @tc.desc   Testing on av music template create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          avMusicTemplate.onAVMusicTemplateCreate((des: avMusicTemplate.AVMusicTemplateDescriptor) => {});
          done();
        } catch (err) {
          CommonUtils.logError(TAG,
            "ON_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0401 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0500
     * @tc.desc   Testing off av music template create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          avMusicTemplate.offAVMusicTemplateCreate((des: avMusicTemplate.AVMusicTemplateDescriptor) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG,
            "OFF_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0500 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0501
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0501
     * @tc.desc   Testing off av music template create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0501',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          avMusicTemplate.offAVMusicTemplateCreate((des: avMusicTemplate.AVMusicTemplateDescriptor) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG,
            "OFF_AV_MUSIC_TEMPLATE_CREATE_THROWS_ERROR_0501 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_DESTROY_THROWS_ERROR_0600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_DESTROY_THROWS_ERROR_0600
     * @tc.desc   Testing on av music template destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_DESTROY_THROWS_ERROR_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          avMusicTemplate.onAVMusicTemplateDestroy((des: avMusicTemplate.AVMusicTemplateDescriptor) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG,
            "ON_AV_MUSIC_TEMPLATE_DESTROY_THROWS_ERROR_0600 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_DESTROY_THROWS_ERROR_0601
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_DESTROY_THROWS_ERROR_0601
     * @tc.desc   Testing on av music template destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_DESTROY_THROWS_ERROR_0601',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          avMusicTemplate.onAVMusicTemplateDestroy((des: avMusicTemplate.AVMusicTemplateDescriptor) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG,
            "ON_AV_MUSIC_TEMPLATE_DESTROY_THROWS_ERROR_0601 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 801).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_DESTROY_THROWS_ERROR_0700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_DESTROY_THROWS_ERROR_0700
     * @tc.desc   Testing off av music template destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_DESTROY_THROWS_ERROR_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          avMusicTemplate.offAVMusicTemplateDestroy((des: avMusicTemplate.AVMusicTemplateDescriptor) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG,
            "OFF_AV_MUSIC_TEMPLATE_DESTROY_THROWS_ERROR_0700 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 201).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_DESTROY_THROWS_ERROR_0701
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_DESTROY_THROWS_ERROR_0701
     * @tc.desc   Testing off av music template destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_DESTROY_THROWS_ERROR_0701',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          avMusicTemplate.offAVMusicTemplateDestroy((des: avMusicTemplate.AVMusicTemplateDescriptor) => {
          });
          done();
        } catch (err) {
          CommonUtils.logError(TAG,
            "OFF_AV_MUSIC_TEMPLATE_DESTROY_THROWS_ERROR_0701 catch err: " + CommonUtils.getError(err));
          expect(Number(err.code) === 801).assertTrue();
          done();
        }
      })


  })
}