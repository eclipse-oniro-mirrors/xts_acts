'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
const SLEEP_TIME = 1000;

export default function arcSliderTest() {
  describe('arcSliderTest', () => {
    beforeAll(() => {
      console.info("arcSliderTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.arcslider.api23.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("arcSliderTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ArcSlider/arcSlider',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get arcSliderTest state pages:" + JSON.stringify(pages));
        if (!("arcSlider" == pages.name)) {
          console.info("get arcSliderTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error("push arcSliderTest page error:" + err);
      }
      console.info("arcSliderTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("arcSliderTest after each called");
    });
    /**
     * @tc.number   ArcSlider_static_001
     * @tc.name     ArcSlider_static_001
     * @tc.desc     call and override the native component/API
     * @tc.level    Level.LEVEL0
     */
    it('ArcSlider_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArcSlider_static_001 START');
      const driver = Driver.create();
      await Utils.sleep(SLEEP_TIME);
      const slider = await driver.findComponent(ON.type('Circle'));
      console.info('ArcSlider_static_001 singleTextSegmentButtonType START:' + JSON.stringify(slider));
      //验证高级组件ArcSlider的组成组件Circle非空，表示高级组件ArcSlider成功被调用
      expect(!!slider).assertEqual(true);
      console.info('ArcSlider_static_001 END');
      done();
    });
  })
}
