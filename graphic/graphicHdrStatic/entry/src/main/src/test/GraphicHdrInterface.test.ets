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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import hdrCapability from '@ohos.graphics.hdrCapability';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext;

export default function GraphicHdrInterface() {

  describe("graphicHdrInterface", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
    })
    /**
     * @tc.name   testHDRFormat_static_0100
     * @tc.number testHDRFormat_static_0100
     * @tc.desc   HDR format enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHDRFormat_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "====testHDRFormat===="
        console.info(msg + ' begin ');
        try {
          expect('0').assertEqual(hdrCapability.HDRFormat.NONE + '');
          expect('1').assertEqual(hdrCapability.HDRFormat.VIDEO_HLG + '');
          expect('2').assertEqual(hdrCapability.HDRFormat.VIDEO_HDR10 + '');
          expect('3').assertEqual(hdrCapability.HDRFormat.VIDEO_HDR_VIVID + '');
          expect('4').assertEqual(hdrCapability.HDRFormat.IMAGE_HDR_VIVID_DUAL + '');
          expect('5').assertEqual(hdrCapability.HDRFormat.IMAGE_HDR_VIVID_SINGLE + '');
          expect('6').assertEqual(hdrCapability.HDRFormat.IMAGE_HDR_ISO_DUAL + '');
          expect('7').assertEqual(hdrCapability.HDRFormat.IMAGE_HDR_ISO_SINGLE + '');
          expect(true).assertTrue()
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