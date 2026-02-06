/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

const TAB_HEIGHT_PX = Math.round(vp2px(13));
const TAB_HEIGHT_DEFAULT_PX = Math.round(vp2px(56));
const MULTI_DEVICE_DEVIATION = 1;

export default function barHeightNoMinHeightLimit() {
  describe('barHeightNoMinHeightLimit', () => {
    beforeEach(async (done: Function) => {
      console.info('barHeightNoMinHeightLimit beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/barHeightNoMinHeightLimit',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get barHeightNoMinHeightLimit state pages:' + JSON.stringify(pages));
        if (!('barHeightNoMinHeightLimit' === pages.name)) {
          console.info('get barHeightNoMinHeightLimit pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push barHeightNoMinHeightLimit page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push barHeightNoMinHeightLimit page error:' + err);
      }
      console.info('barHeightNoMinHeightLimit beforeEach end');
      done();
    });

    /**
     * @tc.number    barHeightNoMinHeightLimit_001
     * @tc.name      barHeightNoMinHeightLimit_0100
     * @tc.desc      The height of tabBar has no minimum height limit. The value is true.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('barHeightNoMinHeightLimit_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[barHeightNoMinHeightLimit_0100] START');
      let tabContent: string = JSON.parse(getInspectorByKey('TabContent')).$attrs.height;
      let tabs: string = JSON.parse(getInspectorByKey('Tabs')).$attrs.height;
      console.info('[barHeightNoMinHeightLimit_0100] value:' + tabContent);
      console.info('[barHeightNoMinHeightLimit_0100] value:' + tabs);
      let num1: number = Math.abs(Math.round(vp2px(parseFloat(tabContent.split('.')[0]))));
      let num2: number = Math.abs(Math.round(vp2px(parseFloat(tabs.split('.')[0]))));
      console.info('[barHeightNoMinHeightLimit_0100] value:' + JSON.stringify(num2 - num1));
      expect((num2 - num1 - TAB_HEIGHT_PX) <= MULTI_DEVICE_DEVIATION).assertTrue();
      console.info('[barHeightNoMinHeightLimit_0100] END');
      done();
    });

    /**
     * @tc.number    barHeightNoMinHeightLimit_002
     * @tc.name      barHeightNoMinHeightLimit_0200
     * @tc.desc      The height of tabBar has a minimum height limit. The value is false.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('barHeightNoMinHeightLimit_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[barHeightNoMinHeightLimit_0200] START');
      let tabContent: string = JSON.parse(getInspectorByKey('TabContent2')).$attrs.height;
      let tabs: string = JSON.parse(getInspectorByKey('Tabs2')).$attrs.height;
      console.info('[barHeightNoMinHeightLimit_0200] value:' + tabContent);
      console.info('[barHeightNoMinHeightLimit_0200] value:' + tabs);
      let num1: number = Math.abs(Math.round(vp2px(parseFloat(tabContent.split('.')[0]))));
      let num2: number = Math.abs(Math.round(vp2px(parseFloat(tabs.split('.')[0]))));
      console.info('[barHeightNoMinHeightLimit_0200] value:' + JSON.stringify(num2 - num1));
      expect((num2 - num1 - TAB_HEIGHT_DEFAULT_PX) <= MULTI_DEVICE_DEVIATION).assertTrue();
      console.info('[barHeightNoMinHeightLimit_0200] END');
      done();
    });

    /**
     * @tc.number    barHeightNoMinHeightLimit_003
     * @tc.name      barHeightNoMinHeightLimit_0300
     * @tc.desc      The height of tabBar has a minimum height limit. The value is undefined.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('barHeightNoMinHeightLimit_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[barHeightNoMinHeightLimit_0300] START');
      let tabContent: string = JSON.parse(getInspectorByKey('TabContent3')).$attrs.height;
      let tabs: string = JSON.parse(getInspectorByKey('Tabs3')).$attrs.height;
      console.info('[barHeightNoMinHeightLimit_0300] value:' + tabContent);
      console.info('[barHeightNoMinHeightLimit_0300] value:' + tabs);
      let num1: number = Math.abs(Math.round(vp2px(parseFloat(tabContent.split('.')[0]))));
      let num2: number = Math.abs(Math.round(vp2px(parseFloat(tabs.split('.')[0]))));
      console.info('[barHeightNoMinHeightLimit_0300] value:' + JSON.stringify(num2 - num1));
      expect((num2 - num1 - TAB_HEIGHT_DEFAULT_PX) <= MULTI_DEVICE_DEVIATION).assertTrue();
      console.info('[barHeightNoMinHeightLimit_0300] END');
      done();
    });

    /**
     * @tc.number    barHeightNoMinHeightLimit_004
     * @tc.name      barHeightNoMinHeightLimit_0400
     * @tc.desc      The height of tabBar has a minimum height limit. The value is null.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('barHeightNoMinHeightLimit_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[barHeightNoMinHeightLimit_0400] START');
      let tabContent: string = JSON.parse(getInspectorByKey('TabContent4')).$attrs.height;
      let tabs: string = JSON.parse(getInspectorByKey('Tabs4')).$attrs.height;
      console.info('[barHeightNoMinHeightLimit_0400] value:' + tabContent);
      console.info('[barHeightNoMinHeightLimit_0400] value:' + tabs);
      let num1: number = Math.abs(Math.round(vp2px(parseFloat(tabContent.split('.')[0]))));
      let num2: number = Math.abs(Math.round(vp2px(parseFloat(tabs.split('.')[0]))));
      console.info('[barHeightNoMinHeightLimit_0400] value:' + JSON.stringify(num2 - num1));
      expect((num2 - num1 - TAB_HEIGHT_DEFAULT_PX) <= MULTI_DEVICE_DEVIATION).assertTrue();
      console.info('[barHeightNoMinHeightLimit_0400] END');
      done();
    });
  })
}
