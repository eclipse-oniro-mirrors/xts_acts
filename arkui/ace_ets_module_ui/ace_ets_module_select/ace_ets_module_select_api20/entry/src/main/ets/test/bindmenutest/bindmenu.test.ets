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
 import { Driver, ON, } from '@ohos.UiTest';
 import Utils from '../../MainAbility/common/Utils';
 
 export default function outlineColorTest() {
   describe('outlineColorTest', () => {
     beforeEach(async (done: Function) => {
       console.info('outlineColorTest beforeEach start');
       let options: router.RouterOptions = {
         url: 'MainAbility/pages/bindmenu/bindmenu',
       }
       try {
         router.clear();
         let pages = router.getState();
         console.info('get outlineColorTest state pages:' + JSON.stringify(pages));
         if (!('outlineColorTest' == pages.name)) {
           console.info('get outlineColorTest pages.name:' + JSON.stringify(pages.name));
           let result = await router.pushUrl(options);
           await Utils.sleep(2500);
           console.info('push outlineColorTest page result:' + JSON.stringify(result));
         }
       } catch (err) {
         console.error('push outlineColorTest page error:' + err);
       }
       console.info('outlineColorTest beforeEach end');
       done();
     });
 
     /**
      * @tc.name   bindmenu_001
      * @tc.number bindmenu_001
      * @tc.desc   To test the outlineColor interface color.Red
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('bindmenu_001', Level.LEVEL0, async (done: Function) => {
       let tagName = 'bindmenu_001';
       console.info('[' + tagName + '] START============================');
       let driver: Driver = Driver.create();
       let btn1 = await driver.findComponent(ON.id('bindMenu001'));
       await btn1.click();
       let strJson = getInspectorByKey('bindMenu001');
       console.log('bindmenu_001')
       await Utils.sleep(1000)
       let obj: ESObject = JSON.parse(strJson);
       await Utils.sleep(1000);
       let obj1 :String = obj.$attrs.outlineColor
       console.info("[bindmenu_001] $attrs.options is: " + obj.$attrs.outlineColor.toLowerCase());
       expect(obj1.toLowerCase()).assertEqual(Color.Red);
       console.info('[' + tagName + '] END============================');
       done();
     });
 })
}