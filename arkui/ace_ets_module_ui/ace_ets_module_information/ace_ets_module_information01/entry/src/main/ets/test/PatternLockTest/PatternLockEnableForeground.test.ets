/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';

export default function PatternLockEnableForegroundTest() {
  describe('PatternLockEnableForegroundTest', () => {
    beforeEach(async (done: Function) => {
      console.info("PatternLockEnableForegroundTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PatternLock/PatternLockEnableForeground',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PatternLockEnableForegroundTest state pages: " + JSON.stringify(pages));
        if (!("PatternLockEnableForeground" == pages.name)) {
          console.info("get PatternLockEnableForegroundTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PatternLockEnableForegroundTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PatternLockEnableForegroundTest page error: " + err);
      }
      done();
    })

    /**
     * @tc.name   SUB_ARKUI_PATTERNLOCK_ENABLEFOREGROUND_PARAM_TRUE_001
     * @tc.number SUB_ARKUI_PATTERNLOCK_ENABLEFOREGROUND_PARAM_TRUE_001
     * @tc.desc   测试 PatternLock activateCircleStyle 属性 enableForeground 设置为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_PATTERNLOCK_ENABLEFOREGROUND_PARAM_TRUE_001', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_BASESHAPE_WIDTH_PARAM_NULL_001 START');
      let strJson: string = getInspectorByKey('PatternLockEnableForeground_PatternLock_True');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('PatternLock');
      console.info('SUB_ARKUI_BASESHAPE_WIDTH_PARAM_NULL_001 END');
    })

    /**
     * @tc.name   SUB_ARKUI_PATTERNLOCK_ENABLEFOREGROUND_PARAM_FALSE_001
     * @tc.number SUB_ARKUI_PATTERNLOCK_ENABLEFOREGROUND_PARAM_FALSE_001
     * @tc.desc   测试 PatternLock activateCircleStyle 属性 enableForeground 设置为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_PATTERNLOCK_ENABLEFOREGROUND_PARAM_FALSE_001', Level.LEVEL2, async () => {
      console.info('SUB_ARKUI_PATTERNLOCK_ENABLEFOREGROUND_PARAM_FALSE_001 START');
      let strJson: string = getInspectorByKey('PatternLockEnableForeground_PatternLock_False');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('PatternLock');
      console.info('SUB_ARKUI_PATTERNLOCK_ENABLEFOREGROUND_PARAM_FALSE_001 END');
    })
  })
}
