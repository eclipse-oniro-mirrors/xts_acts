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

export default function popupTest() {
  describe('popupTest', () => {
    beforeAll(() => {
      console.info("popupTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.popup.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("popupTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popup/popup',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get popupTest state pages:" + JSON.stringify(pages));
        if (!("popup" == pages.name)) {
          console.info("get popupTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error("push popupTest page error:" + err);
      }
      console.info("popupTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME);
      console.info("popupTest after each called");
    });
    /**
     * @tc.number   Popup_static_001
     * @tc.name     Popup_static_001
     * @tc.desc     call and override the native component/API
     * @tc.level    Level.LEVEL0
     */
    it('Popup_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Popup_static_001 START');
      try {
        const driver = Driver.create();
        const button = await driver.findComponent(ON.id('btn'));
        await (button?.click() as Promise<void>);
        await Utils.sleep(SLEEP_TIME);
        let message = inspector.getInspectorByKey('message');
        let obj = JSON.parseJsonElement(message);
        console.info('popupTest001 is: ' + obj.getElement('$attrs').getString('content'));
        expect(obj.getElement('$attrs').getString('content')).assertEqual('message');
        const image = await driver.findComponent(ON.type('Image'));
        console.info('ArcSlider_static_001 singleTextSegmentButtonType START:' + JSON.stringify(image));
        //验证高级组件Popup的组成组件Image非空，表示高级组件Popup成功被调用
        expect(!!image).assertEqual(true);
        console.info('popupTest001 END');
        done();
      }catch(error){
        console.info('popupTest001 END');
        expect().assertFail();
        done();
      }
    });
  })
}
