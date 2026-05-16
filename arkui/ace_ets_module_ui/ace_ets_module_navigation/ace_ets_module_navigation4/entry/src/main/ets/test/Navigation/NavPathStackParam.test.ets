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

export default function NavPathStackParam() {
  describe('NavPathStackParam', () => {
    beforeEach(async (done: Function) => {
      console.info('NavPathStackParam beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPathStackParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get NavPathStackParam state pages:' + JSON.stringify(pages));
        if (!('NavPathStackParam' == pages.name)) {
          console.info('get NavPathStackParam pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push NavPathStackParam page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push NavPathStackParam page error:' + err);
      }
      console.info('NavPathStackParam beforeEach end');
      done();
    });

    /**
     * @tc.name   NavPathStackParam_0010
     * @tc.number NavPathStackParam_0010
     * @tc.desc   Test pushPathByName null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0010', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0010] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName(null, null)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0010] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0010] END');
    })

    /**
     * @tc.name   NavPathStackParam_0020
     * @tc.number NavPathStackParam_0020
     * @tc.desc   Test pushPathByName null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0020', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0020] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName(undefined, undefined)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0020] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0020] END');
    })

    /**
     * @tc.name   NavPathStackParam_0040
     * @tc.number NavPathStackParam_0040
     * @tc.desc   Test pushPathByName null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0040', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0040] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName(undefined, undefined, () => {}, true)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0040] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0040] END');
    })

    /**
     * @tc.name   NavPathStackParam_0050
     * @tc.number NavPathStackParam_0050
     * @tc.desc   Test pushPathByName null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0050', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0050] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName(undefined, undefined, () => {}, false)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0050] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0050] END');
    })

    /**
     * @tc.name   NavPathStackParam_0060
     * @tc.number NavPathStackParam_0060
     * @tc.desc   Test pushPath
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0060', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0060] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPath({
          name: 'null',
          param: "paramTest",
          isEntry: true,
          navDestinationId: ''
        })
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0060] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0060] END');
    })

    /**
     * @tc.name   NavPathStackParam_0070
     * @tc.number NavPathStackParam_0070
     * @tc.desc   Test pushPath
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0070', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0070] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPath({
          name: 'null',
          param: "paramTest",
          isEntry: false,
          navDestinationId: ''
        }, { launchMode: LaunchMode.STANDARD, animated: true })
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0070] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0070] END');
    })

    /**
     * @tc.name   NavPathStackParam_0080
     * @tc.number NavPathStackParam_0080
     * @tc.desc   Test pushPath
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0080', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0080] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPath({
          name: 'null',
          param: "paramTest",
          isEntry: false,
          navDestinationId: ''
        }, { launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON, animated: false })
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0080] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0080] END');
    })

    /**
     * @tc.name   NavPathStackParam_0090
     * @tc.number NavPathStackParam_0090
     * @tc.desc   Test pushPath
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0090', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0090] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPath({
          name: 'null',
          param: "paramTest",
          isEntry: false,
          navDestinationId: ''
        }, { launchMode: LaunchMode.POP_TO_SINGLETON, animated: false })
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0090] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0090] END');
    })

    /**
     * @tc.name   NavPathStackParam_0100
     * @tc.number NavPathStackParam_0100
     * @tc.desc   Test pushPath
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0100', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0100] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPath({
          name: 'null',
          param: "paramTest",
          isEntry: false,
          navDestinationId: ''
        }, { launchMode: LaunchMode.NEW_INSTANCE, animated: false })
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0100] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0100] END');
    })

    /**
     * @tc.name   NavPathStackParam_0110
     * @tc.number NavPathStackParam_0110
     * @tc.desc   Test pushPath
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0110', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0110] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPath(null, null)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0110] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0110] END');
    })

    /**
     * @tc.name   NavPathStackParam_0120
     * @tc.number NavPathStackParam_0120
     * @tc.desc   Test pushPath
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0120', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0120] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPath(undefined, undefined)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0120] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0120] END');
    })

    /**
     * @tc.name   NavPathStackParam_0130
     * @tc.number NavPathStackParam_0130
     * @tc.desc   Test pushDestination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0130', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0130] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushDestination({
          name: 'null',
          param: "paramTest",
          isEntry: true,
          navDestinationId: ''
        })
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0130] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0130] END');
    })

    /**
     * @tc.name   NavPathStackParam_0140
     * @tc.number NavPathStackParam_0140
     * @tc.desc   Test pushDestination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0140', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0140] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushDestination({
          name: 'null',
          param: "paramTest",
          isEntry: false,
          navDestinationId: ''
        }, { launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON, animated: false })
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0140] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0140] END');
    })

    /**
     * @tc.name   NavPathStackParam_0150
     * @tc.number NavPathStackParam_0150
     * @tc.desc   Test pushDestination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0150', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0150] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushDestination({
          name: 'null',
          param: "paramTest",
          isEntry: false,
          navDestinationId: ''
        }, { launchMode: LaunchMode.POP_TO_SINGLETON, animated: false })
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0150] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0150] END');
    })

    /**
     * @tc.name   NavPathStackParam_0160
     * @tc.number NavPathStackParam_0160
     * @tc.desc   Test pushDestination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0160', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0160] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushDestination({
          name: 'null',
          param: "paramTest",
          isEntry: false,
          navDestinationId: ''
        }, { launchMode: LaunchMode.NEW_INSTANCE, animated: false })
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0160] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0160] END');
    })

    /**
     * @tc.name   NavPathStackParam_0170
     * @tc.number NavPathStackParam_0170
     * @tc.desc   Test pushDestination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0170', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0170] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushDestination(null, null)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0170] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0170] END');
    })

    /**
     * @tc.name   NavPathStackParam_0180
     * @tc.number NavPathStackParam_0180
     * @tc.desc   Test pushDestination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0180', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0180] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushDestination(undefined, undefined)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0180] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0180] END');
    })

    /**
     * @tc.name   NavPathStackParam_0190
     * @tc.number NavPathStackParam_0190
     * @tc.desc   Test pushDestinationByName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0190', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0190] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushDestinationByName(undefined, undefined, true)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0190] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0190] END');
    })

    /**
     * @tc.name   NavPathStackParam_0200
     * @tc.number NavPathStackParam_0200
     * @tc.desc   Test pushDestinationByName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0200', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0200] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushDestinationByName(null, null)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0200] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0200] END');
    })

    /**
     * @tc.name   NavPathStackParam_0210
     * @tc.number NavPathStackParam_0210
     * @tc.desc   Test pushDestinationByName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0210', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0210] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushDestinationByName(undefined, undefined,() => {},  false)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0210] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0210] END');
    })

    /**
     * @tc.name   NavPathStackParam_0220
     * @tc.number NavPathStackParam_0220
     * @tc.desc   Test pushDestinationByName
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0220', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0210] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushDestinationByName(undefined, undefined,() => {},  true)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0220] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0220] END');
    })

    /**
     * @tc.name   NavPathStackParam_0030
     * @tc.number NavPathStackParam_0030
     * @tc.desc   Test pushPathByName null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('NavPathStackParam_0030', Level.LEVEL0, async () => {
      console.info('[NavPathStackParam_0030] START');
      await CommonFunc.sleep(1000);
      let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
      try {
        navPathStack.pushPathByName('', undefined, true)
        let strJson = getInspectorByKey('homeTextId');
        let obj: ESObject = JSON.parse(strJson);
        expect(obj.$attrs.content).assertEqual('HomePage');
      } catch (error) {
        console.info('[NavPathStackParam_0030] ERROR: ' + JSON.stringify(error));
        expect(false).assertTrue();
      }
      console.info('[NavPathStackParam_0030] END');
    })
  })
}