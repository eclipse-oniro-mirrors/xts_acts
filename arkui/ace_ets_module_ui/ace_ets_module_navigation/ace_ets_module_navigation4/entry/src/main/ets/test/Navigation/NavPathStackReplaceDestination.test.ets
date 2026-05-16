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

export default function NavPathStackReplaceDestination() {
  describe('NavPathStackReplaceDestination', () => {
    beforeEach(async (done: Function) => {
      console.info('NavPathStackReplaceDestination beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStackParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get NavPathStackReplaceDestination state pages:' + JSON.stringify(pages));
        if (!('NavPathStackParam' == pages.name)) {
          console.info('get NavPathStackReplaceDestination pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push NavPathStackReplaceDestination page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push NavPathStackReplaceDestination page error:' + err);
      }
      console.info('NavPathStackReplaceDestination beforeEach end');
      done();
    });

    /**
     * @tc.name   NavPathStackReplaceDestination_0010
     * @tc.number NavPathStackReplaceDestination_0010
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackReplaceDestination_0010', Level.LEVEL0, async () => {
      console.info('[NavPathStackReplaceDestination_0010] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.replaceDestination({name: null, isEntry: true, navDestinationId: ''})
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackReplaceDestination_0010] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackReplaceDestination_0010] END');
    })

    /**
     * @tc.name   NavPathStackReplaceDestination_0020
     * @tc.number NavPathStackReplaceDestination_0020
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackReplaceDestination_0020', Level.LEVEL0, async () => {
      console.info('[NavPathStackReplaceDestination_0020] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.replaceDestination({name: null, isEntry: false, navDestinationId: ''})
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackReplaceDestination_0020] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackReplaceDestination_0020] END');
    })

    /**
     * @tc.name   NavPathStackReplaceDestination_0030
     * @tc.number NavPathStackReplaceDestination_0030
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackReplaceDestination_0030', Level.LEVEL0, async () => {
      console.info('[NavPathStackReplaceDestination_0030] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.replaceDestination(undefined, { launchMode: LaunchMode.STANDARD, animated: false })
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackReplaceDestination_0030] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackReplaceDestination_0030] END');
    })

    /**
     * @tc.name   NavPathStackReplaceDestination_0040
     * @tc.number NavPathStackReplaceDestination_0040
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackReplaceDestination_0040', Level.LEVEL0, async () => {
      console.info('[NavPathStackReplaceDestination_0040] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.replaceDestination(undefined, { launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON, animated: false })
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackReplaceDestination_0040] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackReplaceDestination_0040] END');
    })

    /**
     * @tc.name   NavPathStackReplaceDestination_0050
     * @tc.number NavPathStackReplaceDestination_0050
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackReplaceDestination_0050', Level.LEVEL0, async () => {
      console.info('[NavPathStackReplaceDestination_0050] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.replaceDestination(undefined, { launchMode: LaunchMode.POP_TO_SINGLETON, animated: false })
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackReplaceDestination_0050] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackReplaceDestination_0050] END');
    })

    /**
     * @tc.name   NavPathStackReplaceDestination_0060
     * @tc.number NavPathStackReplaceDestination_0060
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackReplaceDestination_0060', Level.LEVEL0, async () => {
      console.info('[NavPathStackReplaceDestination_0060] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.replaceDestination(undefined, { launchMode: LaunchMode.NEW_INSTANCE, animated: true })
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackReplaceDestination_0060] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackReplaceDestination_0060] END');
    })

    /**
     * @tc.name   NavPathStackReplaceDestination_0070
     * @tc.number NavPathStackReplaceDestination_0070
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackReplaceDestination_0070', Level.LEVEL0, async () => {
      console.info('[NavPathStackReplaceDestination_0070] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.replaceDestination(undefined)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackReplaceDestination_0070] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackReplaceDestination_0070] END');
    })

    /**
     * @tc.name   NavPathStackReplaceDestination_0080
     * @tc.number NavPathStackReplaceDestination_0080
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackReplaceDestination_0080', Level.LEVEL0, async () => {
      console.info('[NavPathStackReplaceDestination_0080] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.replaceDestination(null)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackReplaceDestination_0080] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackReplaceDestination_0080] END');
    })
  })
}