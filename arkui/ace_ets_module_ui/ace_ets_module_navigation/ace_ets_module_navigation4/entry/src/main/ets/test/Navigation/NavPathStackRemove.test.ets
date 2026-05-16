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

export default function NavPathStackRemove() {
  describe('NavPathStackRemove', () => {
    beforeEach(async (done: Function) => {
      console.info('NavPathStackRemove beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStackParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get NavPathStackRemove state pages:' + JSON.stringify(pages));
        if (!('NavPathStackParam' == pages.name)) {
          console.info('get NavPathStackRemove pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push NavPathStackRemove page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push NavPathStackRemove page error:' + err);
      }
      console.info('NavPathStackRemove beforeEach end');
      done();
    });

    /**
     * @tc.name   NavPathStackRemove_0010
     * @tc.number NavPathStackRemove_0010
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackRemove_0010', Level.LEVEL0, async () => {
      console.info('[NavPathStackRemove_0010] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.replacePathByName(null, null, false)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackRemove_0010] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackRemove_0010] END');
    })

    /**
     * @tc.name   NavPathStackRemove_0020
     * @tc.number NavPathStackRemove_0020
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackRemove_0020', Level.LEVEL0, async () => {
      console.info('[NavPathStackRemove_0020] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.replacePathByName(undefined, undefined, true)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackRemove_0020] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackRemove_0020] END');
    })

    /**
     * @tc.name   NavPathStackRemove_0030
     * @tc.number NavPathStackRemove_0030
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackRemove_0030', Level.LEVEL0, async () => {
      console.info('[NavPathStackRemove_0030] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.removeByIndexes(null)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackRemove_0030] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackRemove_0030] END');
    })

    /**
     * @tc.name   NavPathStackRemove_0040
     * @tc.number NavPathStackRemove_0040
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackRemove_0040', Level.LEVEL0, async () => {
      console.info('[NavPathStackRemove_0040] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.removeByIndexes(undefined)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackRemove_0040] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackRemove_0040] END');
    })

    /**
     * @tc.name   NavPathStackRemove_0050
     * @tc.number NavPathStackRemove_0050
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackRemove_0050', Level.LEVEL0, async () => {
      console.info('[NavPathStackRemove_0050] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.removeByName(null)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackRemove_0050] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackRemove_0050] END');
    })

    /**
     * @tc.name   NavPathStackRemove_0060
     * @tc.number NavPathStackRemove_0060
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackRemove_0060', Level.LEVEL0, async () => {
      console.info('[NavPathStackRemove_0060] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.removeByName(undefined)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackRemove_0060] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackRemove_0060] END');
    })

    /**
     * @tc.name   NavPathStackRemove_0070
     * @tc.number NavPathStackRemove_0070
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackRemove_0070', Level.LEVEL0, async () => {
      console.info('[NavPathStackRemove_0070] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.removeByNavDestinationId(null)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackRemove_0070] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackRemove_0070] END');
    })

    /**
     * @tc.name   NavPathStackRemove_0080
     * @tc.number NavPathStackRemove_0080
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackRemove_0080', Level.LEVEL0, async () => {
      console.info('[NavPathStackRemove_0080] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.removeByNavDestinationId(undefined)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackRemove_0080] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackRemove_0080] END');
    })

    /**
     * @tc.name   NavPathStackRemove_0090
     * @tc.number NavPathStackRemove_0090
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackRemove_0090', Level.LEVEL0, async () => {
      console.info('[NavPathStackRemove_0090] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.removeByNavDestinationId('')
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackRemove_0090] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackRemove_0090] END');
    })

    /**
     * @tc.name   NavPathStackRemove_0100
     * @tc.number NavPathStackRemove_0100
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackRemove_0100', Level.LEVEL0, async () => {
      console.info('[NavPathStackRemove_0100] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.removeByName('')
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackRemove_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackRemove_0100] END');
    })

    /**
     * @tc.name   NavPathStackRemove_0110
     * @tc.number NavPathStackRemove_0110
     * @tc.desc   Test replaceDestination null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackRemove_0110', Level.LEVEL0, async () => {
      console.info('[NavPathStackRemove_0110] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.replacePathByName('', undefined, false)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        console.info('[NavPathStackRemove_0110] obj is: ' + obj ? JSON.stringify(obj) : obj);
        console.info('[NavPathStackRemove_0110] obj content: ' + obj?.$attrs?.content);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackRemove_0110] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackRemove_0110] END');
    })
  })
}