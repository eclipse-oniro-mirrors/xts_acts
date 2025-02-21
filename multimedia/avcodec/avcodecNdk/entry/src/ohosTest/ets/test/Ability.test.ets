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

import hilog from '@ohos.hilog';
import testNapi from 'libentry.so'
// @ts-nocheck
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    enum Drm_ErrorCode {
      DRM_ERR_OK = 0,
      DRM_CAPI_ERR_BASE = 24700500,
      DRM_ERR_NO_MEMORY = 24700501,
      DRM_ERR_OPERATION_NOT_PERMITTED = 24700502,
      DRM_ERR_INVALID_VAL = 24700503,
      DRM_ERR_IO = 24700504,
      DRM_ERR_TIMEOUT = 24700505,
      DRM_ERR_UNKNOWN = 24700506,
      DRM_ERR_SERVICE_DIED = 24700507,
      DRM_ERR_INVALID_STATE = 24700508,
      DRM_ERR_UNSUPPORTED = 24700509,
      DRM_ERR_MAX_SYSTEM_NUM_REACHED = 24700510,
      DRM_ERR_MAX_SESSION_NUM_REACHED = 24700511,
      DRM_ERR_EXTEND_START = 24700600
    }

    /* *
    * @tc.number    : SUB_MULTIMEDIA_AVCODEC_C_API_001
    * @tc.name      : Test_VideoDecoder_SetDecryptionConfig
    * @tc.desc      : 码流解密配置
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AVCODEC_C_API_001', 0, async (done: Function) => {
      let c = testNapi.Test_VideoDecoder_SetDecryptionConfig("ptr","ptr",false);
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
    * @tc.number    : SUB_MULTIMEDIA_AVSOURCE_C_API_001
    * @tc.name      : Test_AVDemuxer_GetMediaKeySystemInfo
    * @tc.desc      : AVDemuxer参数获取
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_AVSOURCE_C_API_001', 0, async (done: Function) => {
      let c = testNapi.Test_AVDemuxer_GetMediaKeySystemInfo("ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })
    /* *
  * @tc.number    : SUB_MULTIMEDIA_AVSOURCE_C_API_002
  * @tc.name      : Test_AVDemuxer_SetMediaKeySystemInfoCallback
  * @tc.desc      : AVDemuxer参数获取
  * @tc.size      : MediumTest
  * @tc.type      : Function test
  * @tc.level     : Level0
  */
    it('SUB_MULTIMEDIA_AVSOURCE_C_API_002', 0, async (done: Function) => {
      let c = testNapi.Test_AVDemuxer_SetMediaKeySystemInfoCallback("ptr","ptr");
      expect(c).assertEqual(Drm_ErrorCode.DRM_ERR_OK);
      done();
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_AVCODEC_C_API_005
    * @tc.name      : Test_VideoDecoder_SetDecryptionConfig
    * @tc.desc      : 图库picker
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_PICKER_C_API_005', 0, async (done: Function) => {
	  let phAccessHelper:photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(mContext);
      let destUri1: string = await phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig1);
	  
	  this.pickerController.setPhotoBrowserItem(this.selectedUris[0], PhotoBrowserRange.SELECTED_ONLY);
	  this.pickerController.setPhotoBrowserItem(uri, PhotoBrowserRange.ALL);
	  this.pickerController.setPhotoBrowserItem(uri, PhotoBrowserRange.SELECTED_ONLY);
	  this.pickerController.setPhotoBrowserItem(uri, PhotoBrowserRange.period);
	  this.pickerController.setPhotoBrowserItem(uri, PhotoBrowserRange.photoSource);
	  this.pickerController.setPhotoBrowserItem(uri, PhotoSource.ALL);
	  this.pickerController.setPhotoBrowserItem(uri, PhotoSource.SCREENSHOT);
	  
      router.back();
      console.info("testPicer21 finish");
      events_emitter.off(event.eventId);
      done();
    })

  })
}