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
 
 export default function ModifierPage() {
   describe('ModifierPage', () => {
     beforeEach(async (done: Function) => {
       console.info('ModifierPage beforeEach start');
       let options: router.RouterOptions = {
         url: 'MainAbility/pages/ModifierSelect/ModifierSelect',
       }
       try {
         router.clear();
         let pages = router.getState();
         console.info('get ModifierPage state pages:' + JSON.stringify(pages));
         if (!('ModifierPage' == pages.name)) {
           console.info('get ModifierPage pages.name:' + JSON.stringify(pages.name));
           let result = await router.pushUrl(options);
           await Utils.sleep(2500);
           console.info('push ModifierPage page result:' + JSON.stringify(result));
         }
       } catch (err) {
         console.error('push ModifierPage page error:' + err);
       }
       console.info('ModifierPage beforeEach end');
       done();
     });
 
     /* *
      * @tc.number: ModifierSelect001
      * @tc.name  : ModifierSelect001
      * @tc.desc  : To test the ModifierPage
      * @tc.level : Level 3
      * @tc.type
      * @tc.size
      */
     it('ModifierSelect001', Level.LEVEL3, async (done: Function) => {
       let Key: string = 'ModifierSelect01'
        let strJson = getInspectorByKey(Key);
       console.log('ModifierSelect001')
       await Utils.sleep(1000)
       let obj: Record<string, ESObject> = JSON.parse(strJson);
       console.info('ModifierSelect001 ' + obj.$attrs.avoidance);
       done();
     });
 })
}