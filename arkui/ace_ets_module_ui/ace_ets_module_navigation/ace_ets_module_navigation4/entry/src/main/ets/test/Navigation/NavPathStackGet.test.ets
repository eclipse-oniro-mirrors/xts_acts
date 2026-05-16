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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function NavPathStackGet() {
  describe('NavPathStackGet', () => {
    beforeEach(async (done: Function) => {
      console.info('NavPathStackGet beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStackParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get NavPathStackGet state pages:' + JSON.stringify(pages));
        if (!('NavPathStackParam' == pages.name)) {
          console.info('get NavPathStackGet pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push NavPathStackGet page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push NavPathStackGet page error:' + err);
      }
      console.info('NavPathStackGet beforeEach end');
      done();
    });

    /**
     * @tc.name   NavPathStackGet_0010
     * @tc.number NavPathStackGet_0010
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackGet_0010', Level.LEVEL0, async () => {
      console.info('[NavPathStackGet_0010] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.getParamByIndex(null)
        navPathStack.getParamByIndex(undefined)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackGet_0010] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackGet_0010] END');
    })

    /**
     * @tc.name   NavPathStackGet_0020
     * @tc.number NavPathStackGet_0020
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackGet_0020', Level.LEVEL0, async () => {
      console.info('[NavPathStackGet_0020] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.getParamByName(undefined)
        navPathStack.getParamByName(null)
        navPathStack.getParamByName('')
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackGet_0020] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackGet_0020] END');
    })

    /**
     * @tc.name   NavPathStackGet_0030
     * @tc.number NavPathStackGet_0030
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackGet_0030', Level.LEVEL0, async () => {
      console.info('[NavPathStackGet_0030] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.getIndexByName(null)
        navPathStack.getIndexByName('')
        navPathStack.getIndexByName(undefined)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackGet_0030] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackGet_0030] END');
    })

  })
}