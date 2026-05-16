/**
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
 import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
 import { BY, UiDriver } from '@kit.TestKit';
 import { router } from '@kit.ArkUI';
 import Utils from '../../MainAbility/common/Utils';
 import { Driver, ON, } from '@ohos.UiTest';
 import { Want } from '@kit.AbilityKit';

 export default function selectmenuOutline() {
   describe('selectmenuOutline', () => {
     beforeEach(async (done: Function) => {
       console.info('selectmenuOutline beforeEach start');
       let options: router.RouterOptions = {
         url: 'MainAbility/pages/select/select',
       }
       try {
         router.clear();
         let pages = router.getState();
         console.info('get selectmenuOutline state pages:' + JSON.stringify(pages));
         if (!('selectmenuOutline' == pages.name)) {
           console.info('get selectmenuOutline pages.name:' + JSON.stringify(pages.name));
           let result = await router.pushUrl(options);
           await Utils.sleep(2500);
           console.info('push selectmenuOutline page result:' + JSON.stringify(result));
         }
       } catch (err) {
         console.error('push selectmenuOutline page error:' + err);
       }
       console.info('selectmenuOutline beforeEach end');
       done();
     });
 
    /**
     * @tc.name   menuOutline_001
     * @tc.number menuOutline_001
     * @tc.desc   To test the menuOutline interface color.White
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('menuOutline_001', Level.LEVEL0, async (done: Function) => {
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('menuOutline'));
      await btn.click();
      let strJson = getInspectorByKey('menuOutline');
      console.log('menuOutline_001')
      await Utils.sleep(1000)
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      done();
    });
 })
}