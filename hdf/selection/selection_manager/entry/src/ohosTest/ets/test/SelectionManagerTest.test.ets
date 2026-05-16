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

import SelectionExtensionAbility from '@ohos.selectionInput.SelectionExtensionAbility';
import SelectionExtensionContext from '@ohos.selectionInput.SelectionExtensionContext';
import { PanelInfo, PanelType } from '@ohos.selectionInput.SelectionPanel';
import selectionManager from '@ohos.selectionInput.selectionManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';

const TAG = '[SelectionManagerTest]';
export default function SelectionManagerTest() {
  describe('SelectionManagerTest', () => {

    beforeAll(async () => {
      console.log(TAG, '************* Unit SelectionManagerTest start*************');
    })

    afterAll(async () => {
      console.log(TAG, '************* Unit SelectionManagerTest end*************');
    })

    /**
     * @tc.name   testSelectionManagerTest0100
     * @tc.number SUB_Driver_Selection_Dyn_0100
     * @tc.desc   OH_Selection testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSelectionManagerTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '*************testSelectionManagerTest0100 start*************');
      try{
        selectionManager.on('selectionCompleted',(info) => {
          expect(info != null).assertTrue();
        });
        done();
      } catch(error) {
        console.error(`Code is ${error.code}, message is ${error.message}`)
        done();
      }
      console.info(TAG, '*************testSelectionManagerTest0100 end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest0200
     * @tc.number SUB_Driver_Selection_Dyn_0200
     * @tc.desc   Test 401, when parameters are invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest0200*************');
      try {
        selectionManager.on(null, (info) => {
          console.info(`testSelectionManagerTest0200 callback enter`);
          done();
        });
      } catch(error) {
        console.info(`testSelectionManagerTest0200 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
      console.info('************* testSelectionManagerTest0200 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest0300
     * @tc.number SUB_Driver_Selection_Dyn_0300
     * @tc.desc   Test 401, when parameters is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest0300*************');
      try {
        selectionManager.on(undefined, (info) => {
          console.info(`testSelectionManagerTest0300 callback enter`);
          done();
        });
      } catch(error) {
        console.info(`testSelectionManagerTest0300 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
      console.info('************* testSelectionManagerTest0300 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest0400
     * @tc.number SUB_Driver_Selection_Dyn_0400
     * @tc.desc   Test 401, when parameters are null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest0400*************');
      try {
        selectionManager.on('selectionCompleted', null);
        console.info(`testSelectionManagerTest0400 is failed`);
        done();
      } catch(error) {
        console.info(`testSelectionManagerTest0400 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
      console.info('************* testSelectionManagerTest0400 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest0500
     * @tc.number SUB_Driver_Selection_Dyn_0500
     * @tc.desc   Test 401, when parameters is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest0500*************');
      try {
        selectionManager.on('selectionCompleted', undefined);
        console.info(`testSelectionManagerTest0500 is failed`);
        done();
      } catch(error) {
        console.info(`testSelectionManagerTest0500 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
      console.info('************* testSelectionManagerTest0500 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest0600
     * @tc.number SUB_Driver_Selection_Dyn_0600
     * @tc.desc   Test off success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest0600*************');
      try {
          selectionManager.on('selectionCompleted', (info) => {
          console.info(`selectionfwk_on_selectionCompleted_003 callback enter`);
          expect(info != null).assertTrue();
          console.info(`testSelectionManagerTest0600 selectioninfo: ${JSON.stringify(info)}`);
          done();
        });
        selectionManager.off('selectionCompleted');
        console.info(`testSelectionManagerTest0600 is success`);
        done();
      } catch(error) {
        console.info(`testSelectionManagerTest0600 throw error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
      console.info('************* testSelectionManagerTest0600 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest0700
     * @tc.number SUB_Driver_Selection_Dyn_0700
     * @tc.desc   Test return 401, when parameters are invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest0700*************');
      try {
        selectionManager.on('selectionCompleted', (info) => {
          console.info(`testSelectionManagerTest0700 callback enter`);
          expect(info != null).assertTrue();
          done();
        });
        selectionManager.off(null);
        console.info(`testSelectionManagerTest0700 is failed`);
        done();
      } catch(error) {
        console.info(`testSelectionManagerTest0700 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
      console.info('************* testSelectionManagerTest0700 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest0800
     * @tc.number SUB_Driver_Selection_Dyn_0800
     * @tc.desc   Test return 401, when parameters are invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest0800*************');
      try {
        selectionManager.on('selectionCompleted', (info) => {
          console.info(`testSelectionManagerTest0800 callback enter`);
          expect(info != null).assertTrue();
          done();
        });
        selectionManager.off(undefined);
        console.info(`testSelectionManagerTest0800 is failed`);
        done();
      } catch(error) {
        console.info(`testSelectionManagerTest0800 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
      console.info('************* testSelectionManagerTest0800 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest0900
     * @tc.number SUB_Driver_Selection_Dyn_0900
     * @tc.desc   Test return 401, when parameters are invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest0900*************');
      try {
          selectionManager.on('selectionCompleted', (info) => {
          console.info(`testSelectionManagerTest0900 callback enter`);
          expect(info != null).assertTrue();
          done();
        });
        selectionManager.off('selectionCompleted', null);
        console.info(`testSelectionManagerTest0900 is success`);
        done();
      } catch(error) {
        console.info(`testSelectionManagerTest0900 throw error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
      console.info('************* testSelectionManagerTest0900 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest1000
     * @tc.number SUB_Driver_Selection_Dyn_1000
     * @tc.desc   Test return 401, when parameters are invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest1000*************');
      try {
        selectionManager.on('selectionCompleted', (info) => {
          console.info(`testSelectionManagerTest1000 callback enter`);
          expect(info != null).assertTrue();
          done();
        });
        selectionManager.off('selectionCompleted', undefined);
        console.info(`testSelectionManagerTest1000 is success`);
        done();
      } catch(error) {
        console.info(`testSelectionManagerTest1000 throw error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
      console.info('************* testSelectionManagerTest1000 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest1100
     * @tc.number SUB_Driver_Selection_Dyn_1100
     * @tc.desc   Test return 401, when parameters are invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest1100 Test start*************');
      try {
        let panelInfo: PanelInfo = {
          panelType: PanelType.MENU_PANEL,
          x: 0,
          y: 0,
          width: 100,
          height: 100
        }
        await selectionManager.createPanel(null, panelInfo);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest1100 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
      console.info('************* testSelectionManagerTest1100 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest1200
     * @tc.number SUB_Driver_Selection_Dyn_1200
     * @tc.desc   Test return 401, when parameters are invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest1200 Test start*************');
      try {
        let panelInfo: PanelInfo = {
          panelType: PanelType.MENU_PANEL,
          x: 0,
          y: 0,
          width: 100,
          height: 100
        }
        let panel: selectionManager.Panel = await selectionManager.createPanel(undefined, panelInfo);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest1200 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
      console.info('************* testSelectionManagerTest1200 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest1300
     * @tc.number SUB_Driver_Selection_Dyn_1300
     * @tc.desc   createPanel success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSelectionManagerTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`testSelectionManagerTest1300 start1111111111111`); 
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      console.info(`testSelectionManagerTest1300 throw abilityDelegator: ${JSON.stringify(abilityDelegator)}`);
      let context = abilityDelegator.getAppContext();
      console.info(`testSelectionManagerTest1300 throw context: ${JSON.stringify(context)}`);
      context.stageMode = true;
      try {
        let panelInfo: PanelInfo = {
          panelType: PanelType.MAIN_PANEL,
          x: 0,
          y: 0,
          width: 100,
          height: 100
        }
        let panel: selectionManager.Panel = await selectionManager.createPanel(context, panelInfo)
        console.info(`testSelectionManagerTest1300 throw panel: ${JSON.stringify(panel)}`);
        await selectionManager.destroyPanel(panel);
        done();
      } catch (error) {
        console.info(error);
        console.info(`testSelectionManagerTest1300 throw error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
      console.info('************* testSelectionManagerTest1300 Test end*************');
    });

 /**
     * @tc.name   testSelectionManagerTest4300
     * @tc.number SUB_Driver_Selection_Dyn_4300
     * @tc.desc   Test should throw BusinessError when parameters are invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest4300 Test start*************');
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let context = abilityDelegator.getAppContext();
        context.stageMode = true;
        await selectionManager.createPanel(context, undefined);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest4300 throw error: `, error);
        expect(error.code).assertEqual(401);
        done();
      }
      console.info('************* testSelectionManagerTest4300 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest1400
     * @tc.number SUB_Driver_Selection_Dyn_1400
     * @tc.desc   destroyPanel success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSelectionManagerTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('************* testSelectionManagerTest1400 Test start*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MAIN_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }
      try {
        let panel: selectionManager.Panel = await selectionManager.createPanel(context, panelInfo);
        await selectionManager.destroyPanel(panel);
        console.info(`testSelectionManagerTest1400 promise success`);
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest1400 throw error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
      console.info('************* testSelectionManagerTest1400 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest1500
     * @tc.number SUB_Driver_Selection_Dyn_1500
     * @tc.desc   Test return 401, when parameters is invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest1500 Test start*************');
      try {
        await selectionManager.destroyPanel(undefined);
        console.info(`testSelectionManagerTest1500 promise success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest1500 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
      console.info('************* testSelectionManagerTest1500 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest4500
     * @tc.number SUB_Driver_Selection_Dyn_4500
     * @tc.desc   Test return 401, when parameters is invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest4500 Test start*************');
      try {
        await selectionManager.destroyPanel(null);
        console.info(`testSelectionManagerTest4500 promise success`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest4500 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
      console.info('************* testSelectionManagerTest4500 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest1600
     * @tc.number SUB_Driver_Selection_Dyn_1600
     * @tc.desc   Test return 401, when parameters is invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest1600*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MAIN_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }
      let panel: selectionManager.Panel | undefined = undefined;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        panel.on('destroyed', null);
        expect(false).assertTrue();
        done();
      } catch(error) {
        console.info(`testSelectionManagerTest1600 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      } finally {
        if (panel) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }
      console.info('************* testSelectionManagerTest1600 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest1700
     * @tc.number SUB_Driver_Selection_Dyn_1700
     * @tc.desc   test off success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest1700*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MENU_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }
      let panel: selectionManager.Panel | undefined = undefined;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        panel.on('destroyed', () => {
          console.info('testSelectionManagerTest1700 callback enter');
        });
        panel.off('destroyed');
        await selectionManager.destroyPanel(panel);
        panel = undefined;
        done();
      } catch(error) {
        console.info(`testSelectionManagerTest1700 throw error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      } finally {
        if (panel) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }
      console.info('************* testSelectionManagerTest1700 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest1800
     * @tc.number SUB_Driver_Selection_Dyn_1800
     * @tc.desc   Test return 401, when parameters is invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest1800*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MAIN_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }
      let panel: selectionManager.Panel | undefined = undefined;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        panel.on('hidden', null);
        expect(false).assertTrue();
        done();
      } catch(error) {
        console.info(`testSelectionManagerTest1800 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      } finally {
        if (panel) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }
      console.info('************* testSelectionManagerTest1800 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest1900
     * @tc.number SUB_Driver_Selection_Dyn_1900
     * @tc.desc   test off success.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest1900*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MENU_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }
      let panel: selectionManager.Panel | undefined = undefined;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        panel.on('hidden', ()=>{});
        panel.off('hidden');
        done();
      } catch(error) {
        console.info(`testSelectionManagerTest1900 throw error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      } finally {
        if (panel) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }
      console.info('************* testSelectionManagerTest1900 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest2000
     * @tc.number SUB_Driver_Selection_Dyn_2000
     * @tc.desc   verify ERROR code 401 of setUiContent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest2000 Test start*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MAIN_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }

      let panel: selectionManager.Panel | undefined = undefined;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        await panel.setUiContent(null);
        console.info(`testSelectionManagerTest2000 promise failed`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest2000 result: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      } finally {
        if (panel) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }

      console.info('************* testSelectionManagerTest2000 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest4600
     * @tc.number SUB_Driver_Selection_Dyn_4600
     * @tc.desc   verify ERROR code 401 of setUiContent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest4600 Test start*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MENU_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }

      let panel: selectionManager.Panel | undefined = undefined;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        await panel.setUiContent("");
        console.info(`testSelectionManagerTest4600 promise failed`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest4600 result: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      } finally {
        if (panel) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }
      console.info('************* testSelectionManagerTest4600 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest4700
     * @tc.number SUB_Driver_Selection_Dyn_4700
     * @tc.desc   verify ERROR code 401 of setUiContent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest4700 Test start*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MAIN_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }

      let panel: selectionManager.Panel | undefined = undefined;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        await panel.setUiContent(undefined);
        console.info(`testSelectionManagerTest4700 promise failed`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest4700 result: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      } finally {
        if (panel) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }
      console.info('************* testSelectionManagerTest4700 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest2100
     * @tc.number SUB_Driver_Selection_Dyn_2100
     * @tc.desc   verify ERROR code 33600002 of setUiContent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest2100 Test start*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MENU_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }

      let panel: selectionManager.Panel | undefined = undefined;
      let bDestroyed = false;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        await selectionManager.destroyPanel(panel);
        bDestroyed = true;
        await panel.setUiContent('page1');
        console.info(`testSelectionManagerTest2100 promise failed`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest2100 result: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(33600002);
        done();
      } finally {
        if (!bDestroyed) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }

      console.info('************* testSelectionManagerTest2100 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest2200
     * @tc.number SUB_Driver_Selection_Dyn_2200
     * @tc.desc   verify function of the panel moveToGlobalDisplay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSelectionManagerTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('************* testSelectionManagerTest2200 Test start*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MAIN_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }
      let panel: selectionManager.Panel | undefined = undefined;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        await panel.moveToGlobalDisplay(20, 20);
        console.info(`testSelectionManagerTest2200 promise success`);
        await selectionManager.destroyPanel(panel);
        panel = undefined;
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest2200 throw error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      } finally {
        if (panel) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }
      console.info('************* testSelectionManagerTest2200 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest4800
     * @tc.number SUB_Driver_Selection_Dyn_4800
     * @tc.desc   verify ERROR code 401 of moveToGlobalDisplay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSelectionManagerTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('************* testSelectionManagerTest4800Test start*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MENU_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }
      let panel: selectionManager.Panel | undefined = undefined;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        await panel.moveToGlobalDisplay(null, 20);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest4800 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      } finally {
        if (panel) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }
      console.info('************* testSelectionManagerTest4800 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest4900
     * @tc.number SUB_Driver_Selection_Dyn_4900
     * @tc.desc   verify ERROR code 401 of moveToGlobalDisplay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSelectionManagerTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('************* testSelectionManagerTest4900 Test start*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MAIN_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }
      let panel: selectionManager.Panel | undefined = undefined;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        await panel.moveToGlobalDisplay(20, null);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest4900 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      } finally {
        if (panel) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }
      console.info('************* testSelectionManagerTest4900 Test end*************');
    });

        /**
     * @tc.name   testSelectionManagerTest5000
     * @tc.number SUB_Driver_Selection_Dyn_5000
     * @tc.desc   verify ERROR code 401 of moveToGlobalDisplay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSelectionManagerTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('************* testSelectionManagerTest5000 Test start*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MENU_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }
      let panel: selectionManager.Panel | undefined = undefined;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        await panel.moveToGlobalDisplay(undefined, 20);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest5000 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      } finally {
        if (panel) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }
      console.info('************* testSelectionManagerTest5000 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest5100
     * @tc.number SUB_Driver_Selection_Dyn_5100
     * @tc.desc   verify ERROR code 401 of moveToGlobalDisplay.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSelectionManagerTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('************* testSelectionManagerTest5100 Test start*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MAIN_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }
      let panel: selectionManager.Panel | undefined = undefined;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        await panel.moveToGlobalDisplay(20, undefined);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest5100 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      } finally {
        if (panel) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }
      console.info('************* testSelectionManagerTest5100 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest2300
     * @tc.number SUB_Driver_Selection_Dyn_2300
     * @tc.desc   verify ERROR code 33600002 of the panel hide.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest2300 Test start*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MENU_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }
      let panel: selectionManager.Panel | undefined = undefined;
      let bDestroyed = false;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        await selectionManager.destroyPanel(panel);
        bDestroyed = true;
        await panel.moveToGlobalDisplay(20, 20);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest2300 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(33600002);
        done();
      } finally {
        if (!bDestroyed) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }
      console.info('************* testSelectionManagerTest2300 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest2400
     * @tc.number SUB_Driver_Selection_Dyn_2400
     * @tc.desc   verify ERROR code 33600002 of the panel hide.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest2400 Test start*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MAIN_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }
      let panel: selectionManager.Panel | undefined = undefined;
      let bDestroyed = false;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        await selectionManager.destroyPanel(panel);
        bDestroyed = true;
        await panel.hide();
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest2400 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(33600002);
        done();
      } finally {
        if (!bDestroyed) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }
      console.info('************* testSelectionManagerTest2400 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest2500
     * @tc.number SUB_Driver_Selection_Dyn_2500
     * @tc.desc   verify ERROR code 33600002 of the panel hide.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest2500 Test start*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MENU_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }
      let panel: selectionManager.Panel | undefined = undefined;
      let bDestroyed = false;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        await selectionManager.destroyPanel(panel);
        bDestroyed = true;
        await panel.startMoving();
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest2500 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(33600002);
        done();
      } finally {
        if (!bDestroyed) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }
      console.info('************* testSelectionManagerTest2500 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest2600
     * @tc.number SUB_Driver_Selection_Dyn_2600
     * @tc.desc   verify ERROR code 33600002 of the panel hide.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest2600 Test start*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode = true;
      let panelInfo: PanelInfo = {
        panelType: PanelType.MAIN_PANEL,
        x: 0,
        y: 0,
        width: 100,
        height: 100
      }
      let panel: selectionManager.Panel | undefined = undefined;
      let bDestroyed = false;
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        await selectionManager.destroyPanel(panel);
        bDestroyed = true;
        await panel.show();
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest2600 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(33600002);
        done();
      } finally {
        if (!bDestroyed) {
          await selectionManager.destroyPanel(panel);
          done();
        }
      }
      console.info('************* testSelectionManagerTest2600 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest2700
     * @tc.number SUB_Driver_Selection_Dyn_2700
     * @tc.desc   verify struct SelectionInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSelectionManagerTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('************* testSelectionManagerTest2700 Test start*************');
      let sel : selectionManager.SelectionInfo = {
        selectionType: selectionManager.SelectionType.MOUSE_MOVE,
        startDisplayX: 10,
        startDisplayY: 10,
        endDisplayX: 510,
        endDisplayY: 610,
        startWindowX: 0,
        startWindowY: 0,
        endWindowX: 500,
        endWindowY: 600,
        displayID: 100,
        windowID: 101,
        bundleName: "com.acts.selection.test"
      }
      expect(sel.selectionType == selectionManager.SelectionType.MOUSE_MOVE).assertTrue();
      console.info('************* testSelectionManagerTest2700 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest2800
     * @tc.number SUB_Driver_Selection_Dyn_2800
     * @tc.desc   verify struct SelectionInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSelectionManagerTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('************* testSelectionManagerTest2800 Test start*************');
      let sel : selectionManager.SelectionInfo = {
        selectionType: selectionManager.SelectionType.MOUSE_MOVE,
        startDisplayX: 10,
        startDisplayY: 10,
        endDisplayX: 510,
        endDisplayY: 610,
        startWindowX: 0,
        startWindowY: 0,
        endWindowX: 500,
        endWindowY: 600,
        displayID: 100,
        windowID: 101,
        bundleName: "com.acts.selection.test"
      }
      expect(sel.startDisplayX == 10).assertTrue();
      expect(sel.startDisplayY == 10).assertTrue();
      expect(sel.endDisplayX == 510).assertTrue();
      expect(sel.endDisplayY == 610).assertTrue();
      expect(sel.startWindowX == 0).assertTrue();
      expect(sel.startWindowY == 0).assertTrue();  
      expect(sel.endWindowX == 500).assertTrue();
      expect(sel.endWindowY == 600).assertTrue();
      expect(sel.displayID == 100).assertTrue();
      expect(sel.windowID == 101).assertTrue();
      expect(sel.bundleName == "com.acts.selection.test").assertTrue();   
      console.info('************* testSelectionManagerTest2800 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest2900
     * @tc.number SUB_Driver_Selection_Dyn_2900
     * @tc.desc   verify struct SelectionInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSelectionManagerTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('************* testSelectionManagerTest2900 Test start*************');
      let sel : selectionManager.SelectionInfo = {
        selectionType: selectionManager.SelectionType.DOUBLE_CLICK,
        startDisplayX: 10,
        startDisplayY: 10,
        endDisplayX: 510,
        endDisplayY: 610,
        startWindowX: 0,
        startWindowY: 0,
        endWindowX: 500,
        endWindowY: 600,
        displayID: 100,
        windowID: 101,
        bundleName: "com.acts.selection.test"
      }
      expect(sel.selectionType == selectionManager.SelectionType.DOUBLE_CLICK).assertTrue();
      console.info('************* testSelectionManagerTest2900 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest3000
     * @tc.number SUB_Driver_Selection_Dyn_3000
     * @tc.desc   verify struct SelectionInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSelectionManagerTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('************* testSelectionManagerTest3000 Test start*************');
      let sel : selectionManager.SelectionInfo = {
        selectionType: selectionManager.SelectionType.TRIPLE_CLICK,
        startDisplayX: 10,
        startDisplayY: 10,
        endDisplayX: 510,
        endDisplayY: 610,
        startWindowX: 0,
        startWindowY: 0,
        endWindowX: 500,
        endWindowY: 600,
        displayID: 100,
        windowID: 101,
        bundleName: "com.acts.selection.test"
      }
      expect(sel.selectionType == selectionManager.SelectionType.TRIPLE_CLICK).assertTrue();
      console.info('************* testSelectionManagerTest3000 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest3100
     * @tc.number SUB_Driver_Selection_Dyn_3100
     * @tc.desc   verify struct SelectionInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSelectionManagerTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('************* testSelectionManagerTest3100 Test start*************');
      let panel : PanelInfo = {
        panelType: PanelType.MENU_PANEL,
        x: 10,
        y: 10,
        width: 400,
        height: 600
      }
      expect(panel.panelType == PanelType.MENU_PANEL).assertTrue();
      console.info('************* testSelectionManagerTest3100 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest3200
     * @tc.number SUB_Driver_Selection_Dyn_3200
     * @tc.desc   verify struct SelectionInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSelectionManagerTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('************* testSelectionManagerTest3200 Test start*************');
      let panel : PanelInfo = {
        panelType: PanelType.MAIN_PANEL,
        x: 10,
        y: 10,
        width: 400,
        height: 600
      }
      expect(panel.panelType == PanelType.MAIN_PANEL).assertTrue();
      expect(panel.x == 10).assertTrue();
      expect(panel.y == 10).assertTrue();
      expect(panel.width == 400).assertTrue();
      expect(panel.height == 600).assertTrue();
      console.info('************* testSelectionManagerTest3200 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest3300
     * @tc.number SUB_Driver_Selection_Dyn_3300
     * @tc.desc   Test should throw BusinessError when parameters are invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest3300 Test start*************');
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let context = abilityDelegator.getAppContext();
        context.stageMode = true;
        await selectionManager.createPanel(context, null);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest3300 throw error: `, error);
        expect(error.code).assertEqual(401);
        done();
      }
      console.info('************* testSelectionManagerTest3300 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest3400
     * @tc.number SUB_Driver_Selection_Dyn_3400
     * @tc.desc   Test should throw BusinessError parameters are invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest3400 Test start*************');
      try {
        let panel: selectionManager.Panel | undefined = undefined;
        await selectionManager.destroyPanel(panel);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest3400 throw error: `, error);
        expect(error.code).assertEqual(401);
        done();
      }
      console.info('************* testSelectionManagerTest3400 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest3500
     * @tc.number SUB_Driver_Selection_Dyn_3500
     * @tc.desc   Test should throw BusinessError parameters are invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest3500 Test start*************');
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let context = abilityDelegator.getAppContext();
        context.stageMode = true;
        let panelInfo: PanelInfo = {
          panelType: PanelType.MENU_PANEL,
          x: 0,
          y: 0,
          width: 100,
          height: 100
        }
        let panel: selectionManager.Panel = await selectionManager.createPanel(context, panelInfo);
        await panel.setUiContent("test");
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest3500 throw error: `, error);
        expect(error.code).assertEqual(401);
        done();
      }
      console.info('************* testSelectionManagerTest3500 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest3600
     * @tc.number SUB_Driver_Selection_Dyn_3600
     * @tc.desc   Test should throw BusinessError parameters are invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest3600 Test start*************');
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let context = abilityDelegator.getAppContext();
        context.stageMode = true;
        let panelInfo: PanelInfo = {
          panelType: PanelType.MAIN_PANEL,
          x: 0,
          y: 0,
          width: 100,
          height: 100
        }
        let panel: selectionManager.Panel = await selectionManager.createPanel(context, panelInfo);
        await selectionManager.destroyPanel(panel);
        await panel.show();
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest3600 throw error: `, error);
        expect(error.code).assertEqual(33600002);
        done();
      }
      console.info('************* testSelectionManagerTest3600 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest3700
     * @tc.number SUB_Driver_Selection_Dyn_3700
     * @tc.desc   Test should throw BusinessError parameters are invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest3700 Test start*************');
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let context = abilityDelegator.getAppContext();
        context.stageMode = true;
        let panelInfo: PanelInfo = {
          panelType: PanelType.MAIN_PANEL,
          x: 0,
          y: 0,
          width: 100,
          height: 100
        }
        let panel: selectionManager.Panel = await selectionManager.createPanel(context, panelInfo);
        await selectionManager.destroyPanel(panel);
        await panel.hide();
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest3700 throw error: `, error);
        expect(error.code).assertEqual(33600002);
        done();
      }
      console.info('************* testSelectionManagerTest3700 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest3800
     * @tc.number SUB_Driver_Selection_Dyn_3800
     * @tc.desc   Test should throw BusinessError parameters are invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest3800 Test start*************');
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let context = abilityDelegator.getAppContext();
        context.stageMode = true;
        let panelInfo: PanelInfo = {
          panelType: PanelType.MAIN_PANEL,
          x: 0,
          y: 0,
          width: 100,
          height: 100
        }
        let panel: selectionManager.Panel = await selectionManager.createPanel(context, panelInfo);
        await selectionManager.destroyPanel(panel);
        await panel.startMoving();
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest3800 throw error: `, error);
        expect(error.code).assertEqual(33600002);
        done();
      }
      console.info('************* testSelectionManagerTest3800 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest3900
     * @tc.number SUB_Driver_Selection_Dyn_3900
     * @tc.desc   Test should throw BusinessError parameters are invalid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest3900 Test start*************');
      try {
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let context = abilityDelegator.getAppContext();
        context.stageMode = true;
        let panelInfo: PanelInfo = {
          panelType: PanelType.MAIN_PANEL,
          x: 0,
          y: 0,
          width: 100,
          height: 100
        }
        let panel: selectionManager.Panel = await selectionManager.createPanel(context, panelInfo);
        await selectionManager.destroyPanel(panel);
        await panel.moveToGlobalDisplay(20, 20);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest3900 throw error: `, error);
        expect(error.code).assertEqual(33600002);
        done();
      }
      console.info('************* testSelectionManagerTest3900 Test end*************');
    });

    /**
     * @tc.name   testSelectionManagerTest4000
     * @tc.number SUB_Driver_Selection_Dyn_4000
     * @tc.desc   The code 33600005 is returned when the word content is obtained without the word division operation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest4000 Test start*************');
      try {
        let content: string = await selectionManager.getSelectionContent();
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest4000 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(33600005);
        done();
      }
      await new Promise<void>(resolve => setTimeout(resolve, 500));
      console.info('************* testSelectionManagerTest4000 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest4100
     * @tc.number SUB_Driver_Selection_Dyn_4100
     * @tc.desc   If getSelectionContent is invoked for multiple times without word division, the error code 33600004 is returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* testSelectionManagerTest4100 Test start*************');
      for (let i = 0; i < 50; ++i) {
        try {
          let content: string = await selectionManager.getSelectionContent();
          expect().assertFail();
          done();
        } catch (error) {
          console.info(`testSelectionManagerTest4100 throw error sjw: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(33600005);
          done();
        }
      }
      try {
        let content: string = await selectionManager.getSelectionContent();
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`testSelectionManagerTest4100 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(33600004);
        done();
      }
      await new Promise<void>(resolve => setTimeout(resolve, 500));
      console.info('************* testSelectionManagerTest4100 Test end*************');
      done();
    });

    /**
     * @tc.name   testSelectionManagerTest4200
     * @tc.number SUB_Driver_Selection_Dyn_4200
     * @tc.desc   If getSelectionContent is invoked for multiple times without word division,33600005 is returned after the delay is added.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSelectionManagerTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('************* selectionfwk_get_selection_content_003 Test start*************');
      for (let i = 0; i < 50; ++i) {
        try {
          let content: string = await selectionManager.getSelectionContent();
          expect().assertFail();
          done();
        } catch (error) {
          console.info(`selectionfwk_get_selection_content_003 throw error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(33600005);
          done();
        }
      }
      await new Promise<void>(resolve => setTimeout(resolve, 500));
      try {
        let content: string = await selectionManager.getSelectionContent();
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`selectionfwk_get_selection_content_003 throw error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(33600005);
        done();
      }
      await new Promise<void>(resolve => setTimeout(resolve, 500));
      console.info('************* selectionfwk_get_selection_content_003 Test end*************');
      done();
    });
  })
}
