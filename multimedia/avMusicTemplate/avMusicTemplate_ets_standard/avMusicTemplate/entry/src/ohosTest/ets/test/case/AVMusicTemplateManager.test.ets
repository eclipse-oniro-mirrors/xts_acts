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
import { AVMusicTemplateUtil } from '../utils/AVMusicTemplateUtil.test';
import { CommonUtils } from '../utils/CommonUtil.test';

const TAG = 'avMusicTemplateManagerTest';

export default function avMusicTemplateManagerTest() {
  describe('ActsAVMusicTemplateManagerTest', () => {
    beforeAll(() => {
      CommonUtils.logInfo(TAG, `Start testing avMusicTemplate interfaces`);
    })
    beforeEach(() => {
    })
    afterEach(async () => {
      await CommonUtils.msSleep();
    })
    afterAll(() => {
      CommonUtils.logInfo(TAG, `End testing avMusicTemplate interfaces`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_0100
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_0100
     * @tc.desc   Testing create create AVMusicTemplate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let temp: avMusicTemplate.AVMusicTemplate =
            avMusicTemplate.createAVMusicTemplate(CommonConstants.TEMPLATE_TYPE as avMusicTemplate.AVMusicTemplateType);
          CommonUtils.logInfo(TAG, `"CREATE_AV_MUSIC_TEMPLATE_0100: temp=${JSON.stringify(temp)}`);
          expect(temp).not().assertUndefined();
          expect(temp).not().assertNull();
          expect(temp.sessionId.length).assertLarger(0);
          expect(temp.sessionTag.length).assertLarger(0);
          temp.destroy();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "CREATE_AV_MUSIC_TEMPLATE_0100 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_0200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_0200
     * @tc.desc   Testing create AVMusicTemplateController
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */

    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let temp: avMusicTemplate.AVMusicTemplate =
            avMusicTemplate.createAVMusicTemplate(CommonConstants.TEMPLATE_TYPE as avMusicTemplate.AVMusicTemplateType);
          let des: avMusicTemplate.AVMusicTemplateDescriptor[] = avMusicTemplate.getAllAVMusicTemplateDescriptors();
          expect(des.length).assertLarger(0);
          const sid: string = des[0].sessionId;
          CommonUtils.logInfo(TAG, `002 sessionid=${JSON.stringify(des)}`);
          let controller: avMusicTemplate.AVMusicTemplateController =
            avMusicTemplate.createAVMusicTemplateController(sid);
          CommonUtils.logInfo(TAG, `002 controller ${JSON.stringify(controller)}`)
          expect(controller).not().assertUndefined();
          expect(sid.length).assertLarger(0)
          expect(controller.sessionId).assertEqual(sid);
          await controller.destroy();
          await temp.destroy();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_0200 catch err: " + err);
        }
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_0300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_0300
     * @tc.desc   Testing get all AVMusicTemplateDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let res: avMusicTemplate.AVMusicTemplateDescriptor[] = avMusicTemplate.getAllAVMusicTemplateDescriptors();

          let temp: avMusicTemplate.AVMusicTemplate =
            avMusicTemplate.createAVMusicTemplate(CommonConstants.TEMPLATE_TYPE as avMusicTemplate.AVMusicTemplateType);
          res = avMusicTemplate.getAllAVMusicTemplateDescriptors();
          CommonUtils.logInfo(TAG, `0300 res=${JSON.stringify(res)}`);
          expect(res).not().assertUndefined();
          expect(res.length).assertLarger(0);
          const des = res[0]
          expect(des.sessionId.length).assertLarger(1);
          expect(des.bundleName.length).assertLarger(1);
          expect(des.userId).assertEqual(0);
          await temp.destroy();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_0300 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_0301
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_0301
     * @tc.desc   Testing get all AVMusicTemplateDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_0301',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          await AVMusicTemplateUtil.destroy();
          let res: avMusicTemplate.AVMusicTemplateDescriptor[] = avMusicTemplate.getAllAVMusicTemplateDescriptors();
          expect(res.length).assertEqual(0); // 默认环境pass
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_0301 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_CREATE_0400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_CREATE_0400
     * @tc.desc   Testing on AVMusicTemplate create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_CREATE_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let sessionId = '';
          avMusicTemplate.onAVMusicTemplateCreate((des: avMusicTemplate.AVMusicTemplateDescriptor) => {
            CommonUtils.logInfo(TAG, `'0400: des=${JSON.stringify(des)}`);
            expect(des.sessionId.length).assertLarger(0);
            expect(des.bundleName.length).assertLarger(0);
            expect(des.userId).assertEqual(0);
            sessionId = des.sessionId;
          });
          expect(sessionId.length).assertEqual(0);
          await CommonUtils.msSleep();
          let template: avMusicTemplate.AVMusicTemplate =
            avMusicTemplate.createAVMusicTemplate(CommonConstants.TEMPLATE_TYPE)
          expect(template).not().assertUndefined();
          expect(template).not().assertNull();
          await CommonUtils.msSleep();
          expect(sessionId.length).assertLarger(0);
          await template.destroy();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_AV_MUSIC_TEMPLATE_CREATE_0400 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_CREATE_0500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_CREATE_0500
     * @tc.desc   Testing off AVMusicTemplate create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_CREATE_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let sessionId = '';
          avMusicTemplate.onAVMusicTemplateCreate((des: avMusicTemplate.AVMusicTemplateDescriptor) => {
            sessionId = des.sessionId;
          });
          await CommonUtils.msSleep();
          let template: avMusicTemplate.AVMusicTemplate =
            avMusicTemplate.createAVMusicTemplate(CommonConstants.TEMPLATE_TYPE);
          expect(template).not().assertUndefined();
          expect(template).not().assertNull();
          await CommonUtils.msSleep();
          expect(sessionId.length).assertLarger(0);
          await template.destroy();

          sessionId = '';
          avMusicTemplate.offAVMusicTemplateCreate();
          await CommonUtils.msSleep();
          template = avMusicTemplate.createAVMusicTemplate(CommonConstants.TEMPLATE_TYPE)
          expect(template).not().assertUndefined();
          expect(template).not().assertNull();
          await CommonUtils.msSleep();
          expect(sessionId.length).assertEqual(0);
          await template.destroy();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_AV_MUSIC_TEMPLATE_CREATE_0500 catch err: " + err);
        }
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_DESTROY_0600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_DESTROY_0600
     * @tc.desc   Testing on AVMusicTemplate destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_DESTROY_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let sessionId = '';
          avMusicTemplate.onAVMusicTemplateDestroy((des: avMusicTemplate.AVMusicTemplateDescriptor) => {
            CommonUtils.logInfo(TAG, `006: des=${JSON.stringify(des)}`);
            expect(des.sessionId.length).assertLarger(0);
            expect(des.bundleName.length).assertLarger(0);
            expect(des.userId).assertEqual(0);
            sessionId = des.sessionId;
          });

          let template: avMusicTemplate.AVMusicTemplate =
            avMusicTemplate.createAVMusicTemplate(CommonConstants.TEMPLATE_TYPE);
          expect(template).not().assertUndefined();
          expect(template).not().assertNull();
          await CommonUtils.msSleep();
          await template.destroy();
          await CommonUtils.msSleep();
          expect(sessionId.length).assertLarger(0); // todo avMusicTemplate.onAVMusicTemplateDestroy() invalid
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_AV_MUSIC_TEMPLATE_DESTROY_0600 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_DESTROY_0700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_DESTROY_0700
     * @tc.desc   Testing off av music template destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_DESTROY_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let sessionId = '';
          avMusicTemplate.onAVMusicTemplateDestroy((des: avMusicTemplate.AVMusicTemplateDescriptor) => {
            CommonUtils.logInfo(TAG, `des=${JSON.stringify(des)}`);
            sessionId = des.sessionId;
          });
          let template: avMusicTemplate.AVMusicTemplate =
            avMusicTemplate.createAVMusicTemplate(CommonConstants.TEMPLATE_TYPE);
          expect(template).not().assertUndefined();
          expect(template).not().assertNull();
          await CommonUtils.msSleep();
          await template.destroy();
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `007: before off sessionoId=${JSON.stringify(sessionId)}`);
          expect(sessionId.length).assertLarger(0);

          sessionId = '';
          avMusicTemplate.offAVMusicTemplateDestroy();
          template = avMusicTemplate.createAVMusicTemplate(CommonConstants.TEMPLATE_TYPE);
          expect(template).not().assertUndefined();
          expect(template).not().assertNull();
          await CommonUtils.msSleep();
          await template.destroy();
          await CommonUtils.msSleep();
          CommonUtils.logInfo(TAG, `007:  after off sessionoId=${JSON.stringify(sessionId)}`);
          expect(sessionId.length).assertEqual(0);
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_AV_MUSIC_TEMPLATE_DESTROY_0700 catch err: " + err);
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_0800
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_0800
     * @tc.desc   Testing av music template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let data: avMusicTemplate.AVMusicTemplate = avMusicTemplate.createAVMusicTemplate(CommonConstants.TEMPLATE_TYPE);
        CommonUtils.logInfo(TAG, `template=${data}`);
        expect(data).not().assertUndefined();

        expect(data.sessionId.length).assertLarger(0); // 覆盖AVMusicTemplate所有属性
        expect(data.sessionTag.length).assertLarger(0);

        await data.destroy();
        done();
      } catch (err) {
        CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_0800 catch err: " + err);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_CONTROLLER_0900
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_CONTROLLER_0900
     * @tc.desc   Testing av music template controller
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_AV_MUSIC_TEMPLATE_CONTROLLER_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let temp: avMusicTemplate.AVMusicTemplate =
          avMusicTemplate.createAVMusicTemplate(CommonConstants.TEMPLATE_TYPE as avMusicTemplate.AVMusicTemplateType);
        let des: avMusicTemplate.AVMusicTemplateDescriptor[] = avMusicTemplate.getAllAVMusicTemplateDescriptors(undefined);
        expect(des.length).assertLarger(0);
        const sid: string = des[0].sessionId;
        CommonUtils.logInfo(TAG, `009 sessionid=${JSON.stringify(des)}`);
        let controller: avMusicTemplate.AVMusicTemplateController =
          avMusicTemplate.createAVMusicTemplateController(sid);
        CommonUtils.logInfo(TAG, `009 controller ${JSON.stringify(controller)}`)
        expect(controller).not().assertUndefined();
        expect(controller.isDestroy).assertUndefined(); // 覆盖AVMusicTemplateController所有属性
        expect(controller.sessionId).assertEqual(sid);
        await controller.destroy();
        await temp.destroy();

        done();
      } catch (err) {
        CommonUtils.logError(TAG, "AV_MUSIC_TEMPLATE_CONTROLLER_0900 catch err: " + err);
      }
    })

  })
}