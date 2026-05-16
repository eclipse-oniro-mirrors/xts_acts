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
 import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
 import { BY, UiDriver } from '@kit.TestKit';
 import { router } from '@kit.ArkUI';
 import Utils from '../../MainAbility/common/Utils';
 
 export default function CustomSelectionPage() {
   describe('CustomSelectionPage', () => {
     beforeEach(async (done: Function) => {
       console.info('CustomSelectionPage beforeEach start');
       let options: router.RouterOptions = {
         url: 'MainAbility/pages/CustomSelect/CustomSelect',
       }
       try {
         router.clear();
         let pages = router.getState();
         console.info('get CustomSelectionPage state pages:' + JSON.stringify(pages));
         if (!('CustomSelectionPage' == pages.name)) {
           console.info('get CustomSelectionPage pages.name:' + JSON.stringify(pages.name));
           let result = await router.pushUrl(options);
           await Utils.sleep(2500);
           console.info('push CustomSelectionPage page result:' + JSON.stringify(result));
         }
       } catch (err) {
         console.error('push CustomSelectionPage page error:' + err);
       }
       console.info('CustomSelectionPage beforeEach end');
       done();
     });
 
     /**
      * @tc.name   selecttest_001
      * @tc.number selecttest_001
      * @tc.desc   To test the avoidance interface AVOID_AROUND_TARGET
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it('selecttest_001', Level.LEVEL3, async (done: Function) => {
       let Key: string = 'select01'
       let strJson = getInspectorByKey(Key);
       console.log('selecttest_001')
       await Utils.sleep(1000)
       let obj: Record<string, ESObject> = JSON.parse(strJson);
       console.info('selecttest_001 ' + obj.$attrs.avoidance);
       done();
     });
 })
}