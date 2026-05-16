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

export default function NavPathStackPop() {
  describe('NavPathStackPop', () => {
    beforeEach(async (done: Function) => {
      console.info('NavPathStackPop beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStackParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get NavPathStackPop state pages:' + JSON.stringify(pages));
        if (!('NavPathStackParam' == pages.name)) {
          console.info('get NavPathStackPop pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push NavPathStackPop page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push NavPathStackPop page error:' + err);
      }
      console.info('NavPathStackPop beforeEach end');
      done();
    });

    /**
     * @tc.name   NavPathStackPop_0010
     * @tc.number NavPathStackPop_0010
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('NavPathStackPop_0010', Level.LEVEL2, async () => {
      console.info('[NavPathStackPop_0010] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pop(null)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackPop_0010] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackPop_0010] END');
    })

    /**
     * @tc.name   NavPathStackPop_0020
     * @tc.number NavPathStackPop_0020
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('NavPathStackPop_0020', Level.LEVEL2, async () => {
      console.info('[NavPathStackPop_0020] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pop(undefined)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackPop_0020] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackPop_0020] END');
    })

    /**
     * @tc.name   NavPathStackPop_0030
     * @tc.number NavPathStackPop_0030
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('NavPathStackPop_0030', Level.LEVEL2, async () => {
      console.info('[NavPathStackPop_0030] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.popToName(null, null, false)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackPop_0030] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackPop_0030] END');
    })

    /**
     * @tc.name   NavPathStackPop_0040
     * @tc.number NavPathStackPop_0040
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('NavPathStackPop_0040', Level.LEVEL2, async () => {
      console.info('[NavPathStackPop_0040] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.popToName(undefined, undefined)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackPop_0040] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackPop_0040] END');
    })

    /**
     * @tc.name   NavPathStackPop_0050
     * @tc.number NavPathStackPop_0050
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('NavPathStackPop_0050', Level.LEVEL2, async () => {
      console.info('[NavPathStackPop_0050] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.popToName('')
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackPop_0050] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackPop_0050] END');
    })

    /**
     * @tc.name   NavPathStackPop_0060
     * @tc.number NavPathStackPop_0060
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('NavPathStackPop_0060', Level.LEVEL2, async () => {
      console.info('[NavPathStackPop_0060] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.popToIndex(null, true)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackPop_0060] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackPop_0060] END');
    })

    /**
     * @tc.name   NavPathStackPop_0070
     * @tc.number NavPathStackPop_0070
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('NavPathStackPop_0070', Level.LEVEL2, async () => {
      console.info('[NavPathStackPop_0070] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.popToIndex(undefined, true)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackPop_0070] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackPop_0070] END');
    })

    /**
     * @tc.name   NavPathStackPop_0080
     * @tc.number NavPathStackPop_0080
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('NavPathStackPop_0080', Level.LEVEL2, async () => {
      console.info('[NavPathStackPop_0080] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.popToIndex(null, null, true)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackPop_0080] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackPop_0080] END');
    })

    /**
     * @tc.name   NavPathStackPop_0090
     * @tc.number NavPathStackPop_0090
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('NavPathStackPop_0090', Level.LEVEL2, async () => {
      console.info('[NavPathStackPop_0090] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.popToIndex(undefined, undefined, false)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackPop_0090] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackPop_0090] END');
    })

    /**
     * @tc.name   NavPathStackPop_0100
     * @tc.number NavPathStackPop_0100
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('NavPathStackPop_0100', Level.LEVEL2, async () => {
      console.info('[NavPathStackPop_0100] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.moveToTop(null)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackPop_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackPop_0100] END');
    })

    /**
     * @tc.name   NavPathStackPop_0110
     * @tc.number NavPathStackPop_0110
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('NavPathStackPop_0110', Level.LEVEL2, async () => {
      console.info('[NavPathStackPop_0110] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.moveToTop(undefined, true)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[NavPathStackPop_0110] obj is: ' + obj ? JSON.stringify(obj) : obj);
        console.info('[NavPathStackPop_0110] obj content: ' + obj?.$attrs?.content);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackPop_0110] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackPop_0110] END');
    })

    /**
     * @tc.name   NavPathStackPop_0120
     * @tc.number NavPathStackPop_0120
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('NavPathStackPop_0120', Level.LEVEL2, async () => {
      console.info('[NavPathStackPop_0110] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.moveToTop('')
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[NavPathStackPop_0120] obj is: ' + obj ? JSON.stringify(obj) : obj);
        console.info('[NavPathStackPop_0120] obj content: ' + obj?.$attrs?.content);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackPop_0120] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackPop_0120] END');
    })

    /**
     * @tc.name   NavPathStackPop_0130
     * @tc.number NavPathStackPop_0130
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('NavPathStackPop_0130', Level.LEVEL2, async () => {
      console.info('[NavPathStackPop_0110] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.setPathStack(null)
        navPathStack.setPathStack([])
        navPathStack.setPathStack(undefined, false)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[NavPathStackPop_0130] obj is: ' + obj ? JSON.stringify(obj) : obj);
        console.info('[NavPathStackPop_0130] obj content: ' + obj?.$attrs?.content);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackPop_0130] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackPop_0130] END');
    })

    /**
     * @tc.name   NavPathStackPop_0140
     * @tc.number NavPathStackPop_0140
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('NavPathStackPop_0140', Level.LEVEL2, async () => {
      console.info('[NavPathStackPop_0110] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.clear(true)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[NavPathStackPop_0140] obj is: ' + obj ? JSON.stringify(obj) : obj);
        console.info('[NavPathStackPop_0140] obj content: ' + obj?.$attrs?.content);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackPop_0140] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackPop_0140] END');
    })

    /**
     * @tc.name   NavPathStackPop_0150
     * @tc.number NavPathStackPop_0150
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('NavPathStackPop_0150', Level.LEVEL2, async () => {
      console.info('[NavPathStackPop_0110] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.setInterception(null)
        navPathStack.setInterception(undefined)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[NavPathStackPop_0150] obj is: ' + obj ? JSON.stringify(obj) : obj);
        console.info('[NavPathStackPop_0150] obj content: ' + obj?.$attrs?.content);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackPop_0150] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackPop_0150] END');
    })
  })
}