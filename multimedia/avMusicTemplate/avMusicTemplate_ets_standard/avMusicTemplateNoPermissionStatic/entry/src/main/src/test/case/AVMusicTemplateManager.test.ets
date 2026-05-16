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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../../hypium/index";
import { CommonUtils } from '../utils/CommonUtil.test';

const TAG = 'avMusicTemplateManagerTest';

export default function avMusicTemplateManagerTest() {
  describe('ActsAVMusicTemplateManagerTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_STATIC_0200
     * @tc.desc   Testing create AVMusicTemplateController
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          avMusicTemplate.createAVMusicTemplateController('xxxxxx');
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "CREATE_AV_MUSIC_TEMPLATE_CONTROLLER_0200 catch err: " + err);
          expect(err.code).assertEqual(201);
          done();
        }
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_STATIC_0300
     * @tc.desc   Testing get all AVMusicTemplateDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_STATIC_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          avMusicTemplate.getAllAVMusicTemplateDescriptors();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "GET_ALL_AV_MUSIC_TEMPLATE_DESCRIPTORS_0300 catch err: " + err);
          expect(err.code).assertEqual(201);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_CREATE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_CREATE_STATIC_0400
     * @tc.desc   Testing on AVMusicTemplate create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_CREATE_STATIC_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          avMusicTemplate.onAVMusicTemplateCreate((des: avMusicTemplate.AVMusicTemplateDescriptor) => {});
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_AV_MUSIC_TEMPLATE_CREATE_0400 catch err: " + err);
          expect(err.code).assertEqual(201);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_CREATE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_CREATE_STATIC_0500
     * @tc.desc   Testing off AVMusicTemplate create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_CREATE_STATIC_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          avMusicTemplate.offAVMusicTemplateCreate((des: avMusicTemplate.AVMusicTemplateDescriptor) => {});
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_AV_MUSIC_TEMPLATE_CREATE_0500 catch err: " + err);
          expect(err.code).assertEqual(201);
          done();
        }
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_DESTROY_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_DESTROY_STATIC_0600
     * @tc.desc   Testing on AVMusicTemplate destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_ON_AV_MUSIC_TEMPLATE_DESTROY_STATIC_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          avMusicTemplate.onAVMusicTemplateDestroy((des: avMusicTemplate.AVMusicTemplateDescriptor) => {});
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "ON_AV_MUSIC_TEMPLATE_DESTROY_0600 catch err: " + err);
          expect(err.code).assertEqual(201);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_DESTROY_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_DESTROY_STATIC_0700
     * @tc.desc   Testing off av music template destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVMUSICTEMPLATE_OFF_AV_MUSIC_TEMPLATE_DESTROY_STATIC_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          avMusicTemplate.offAVMusicTemplateDestroy();
          done();
        } catch (err) {
          CommonUtils.logError(TAG, "OFF_AV_MUSIC_TEMPLATE_DESTROY_0700 catch err: " + err);
          expect(err.code).assertEqual(201);
          done();
        }
      })
  })
}