/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import { BusinessError } from '@ohos.base';
import { hdrCapability } from '@kit.ArkGraphics2D';

export default function graphicHdrInterfaceTest() {
  describe('graphicHdrInterfaceTest', (done:Function)=> {
    console.log('describe graphicHdrInterfaceTest start!!!')

    beforeAll(async ()=> {
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICHDR_JS_API_001
     * @tc.name      : testHDRFormat
     * @tc.desc      : HDR format enum
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testHDRFormat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 , async (done:Function)=> {
      let msg = "====testHDRFormat===="
      console.info(msg + ' begin ');
      try {
        expect(hdrCapability.HDRFormat.NONE == 0).assertTrue()
        expect(hdrCapability.HDRFormat.VIDEO_HLG == 1).assertTrue()
        expect(hdrCapability.HDRFormat.VIDEO_HDR10 == 2).assertTrue()
        expect(hdrCapability.HDRFormat.VIDEO_HDR_VIVID == 3).assertTrue()
        expect(hdrCapability.HDRFormat.IMAGE_HDR_VIVID_DUAL == 4).assertTrue()
        expect(hdrCapability.HDRFormat.IMAGE_HDR_VIVID_SINGLE == 5).assertTrue()
        expect(hdrCapability.HDRFormat.IMAGE_HDR_ISO_DUAL == 6).assertTrue()
        expect(hdrCapability.HDRFormat.IMAGE_HDR_ISO_SINGLE == 7).assertTrue()
        done()
      } catch (err) {
        console.log(msg + " Faild in hdrCapability.HDRFormat " + JSON.stringify(err))
        console.log(msg + " Faild in hdrCapability.HDRFormat " + err)
        expect().assertFail()
        done()
      }
    })
  })
}