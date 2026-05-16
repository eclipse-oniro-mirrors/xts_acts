/*
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

'use static'
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { PanelInfo, PanelType } from '@ohos.selectionInput.SelectionPanel';
import selectionManager from '@ohos.selectionInput.selectionManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Want } from '@kit.AbilityKit';
import SelectionExtensionContext from '@ohos.selectionInput.SelectionExtensionContext';
import SelectionExtensionAbility from '@ohos.selectionInput.SelectionExtensionAbility';

// Preconditions:
// hdc shell param set sys.selection.switch on
// hdc shell param set sys.selection.app bundlename/MainAbility

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function selectionTest() {
  describe("selectionTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   selectionfwk_onSelectionComplete_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_0100
     * @tc.desc   verify onSelectionComplete result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("selectionfwk_onSelectionComplete_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_onSelectionComplete_001*************');
      try {
        selectionManager.onSelectionComplete((info: selectionManager.SelectionInfo) => {
        console.info(`selectionfwk_onSelectionComplete_001 callback enter`);
        expect(info != null).assertTrue();
        });
        console.info('************* selectionfwk_onSelectionComplete_001 Test end*************');
        done();
       } catch(error) {
        console.error(`Failed to query device. Code is ${error.code}, message is ${error.message}`);
        console.info('************* selectionfwk_onSelectionComplete_001 Test end*************');
        done();
       }
    })

    /**
     * @tc.name   selectionfwk_offSelectionComplete_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_0200
     * @tc.desc   verify offSelectionComplete result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_offSelectionComplete_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      console.info('************* selectionfwk_offSelectionComplete_001*************');
      try {
        selectionManager.onSelectionComplete((info: selectionManager.SelectionInfo) => {
            console.info(`selectionfwk_offSelectionComplete_001 callback enter`);
            expect(info != null).assertTrue();
        });
        selectionManager.offSelectionComplete();
        console.info(`selectionfwk_off_selectionCompleted_001 is success`);
        console.info('************* selectionfwk_offSelectionComplete_001 Test end*************');
        done();
      } catch(error) {
        console.error(`Failed to query device. Code is ${error.code}, message is ${error.message}`);
        expect(false).assertTrue();
        console.info('************* selectionfwk_offSelectionComplete_001 Test end*************');
        done();
      }
    });

    /**
     * @tc.name   selectionfwk_offSelectionComplete_002
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_3600
     * @tc.desc   verify offSelectionComplete result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_offSelectionComplete_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      console.info('************* selectionfwk_offSelectionComplete_002*************');
      let selectionChangeCallback = (info:selectionManager.SelectionInfo) => {
        console.info(`SelectionInfo: ${JSON.stringify(info)}`);
      };
      try {
        selectionManager.onSelectionComplete(selectionChangeCallback);
        selectionManager.offSelectionComplete(selectionChangeCallback);
        console.info(`selectionfwk_offSelectionComplete_002 is success`);
        done();
      } catch(error) {
        console.error(`Failed to query device. Code is ${error.code}, message is ${error.message}`);
        expect(false).assertTrue();
        console.info('************* selectionfwk_offSelectionComplete_002 Test end*************');
        done();
      }
    });

    /**
     * @tc.name   selectionfwk_createPanel_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_0300
     * @tc.desc   verify createPanel result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_createPanel_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_createPanel_001 Test start*************');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
      abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      let context = abilityDelegator.getAppContext();
      context.stageMode= true;
      try {
        let panelInfo: PanelInfo = {
          panelType: PanelType.MENU_PANEL,
          x: 0,
          y: 0,
          width: 100,
          height: 100
        }
        let panel: selectionManager.Panel = await selectionManager.createPanel(context, panelInfo)
        expect(panel != null).assertTrue();
        if (panel !== undefined) {
          await selectionManager.destroyPanel(panel);
          console.info('************* selectionfwk_createPanel_001 Test end*************');
          done();
        }
        done();
      } catch (error) {
        console.info(`selectionfwk_createPanel_001 throw error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        console.info('************* selectionfwk_createPanel_001 Test end*************');
        done();
      }
    });

    /**
     * @tc.name   selectionfwk_startAbility_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_3700
     * @tc.desc   verify startAbility result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_startAbility_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_startAbility_001 Test start*************');
      let ability = new SelectionExtensionAbility;
      try {
        let wantAbility: Want = {
          bundleName: "com.acts.selection.function.static",
          abilityName: "EntryAbility",
        };
        ability.context.startAbility(wantAbility).then(() => {
          console.info('startAbility success');
        }).catch((error) => {
          expect(false).assertTrue();
          console.info(`selectionfwk_startAbility_001 throw error: [${error.code}, ${error.message}]`);
        })
        done();
      }catch(error){
        console.info(`selectionfwk_startAbility_001 throw error: [${error.code}, ${error.message}]`);
        console.info('************* selectionfwk_startAbility_001 Test end*************');
        done();
      }
    });

    /**
     * @tc.name   selectionfwk_panel_setUiContent_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_0400
     * @tc.desc   verify setUiContent result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_panel_setUiContent_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      console.info('************* selectionfwk_panel_setUiContent_001 Test start*************');
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
        if (panel !== undefined) {
            await selectionManager.destroyPanel(panel);
            bDestroyed = true;
            await panel.setUiContent('page1');
            console.info(`selectionfwk_panel_setUiContent_001 promise failed`);
            expect(false).assertTrue();
        }
      } catch (error) {
        console.info(`selectionfwk_panel_setUiContent_001 result: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(33600002);
      } finally {
        if (!bDestroyed) {
            if (panel !== undefined) {
                await selectionManager.destroyPanel(panel);
            }
        }
        console.info('************* selectionfwk_panel_setUiContent_001 Test end*************');
        done();
      }
    });

    /**
     * @tc.name   selectionfwk_panel_moveToGlobalDisplay_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_0500
     * @tc.desc   verify moveToGlobalDisplay result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_panel_moveToGlobalDisplay_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_panel_moveToGlobalDisplay_001 Test start*************');
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
        if (panel !== undefined) {
            await panel.moveToGlobalDisplay(20, 20);
            console.info(`selectionfwk_panel_moveToGlobalDisplay_001 promise success`);
            await selectionManager.destroyPanel(panel);
            panel = undefined;
        }
      } catch (error) {
        console.info(`selectionfwk_panel_moveToGlobalDisplay_001 throw error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      } finally {
        if (panel !== undefined) {
            await selectionManager.destroyPanel(panel);
        }
        console.info('************* selectionfwk_panel_moveToGlobalDisplay_001 Test end*************');
        done();
      }
    });

    /**
     * @tc.name   selectionfwk_panel_moveToGlobalDisplay_002
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_0600
     * @tc.desc   verify moveToGlobalDisplay errorcode 33600002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('selectionfwk_panel_moveToGlobalDisplay_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_panel_moveToGlobalDisplay_002 Test start*************');
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
        if (panel !== undefined) {
          await selectionManager.destroyPanel(panel);
          bDestroyed = true;
          await panel.moveToGlobalDisplay(20, 20);
          expect(false).assertTrue();
        }
      } catch (error) {
        console.info(`selectionfwk_panel_moveToGlobalDisplay_002 throw error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(33600002);
      } finally {
        if (!bDestroyed) {
          if (panel !== undefined) {
            await selectionManager.destroyPanel(panel);
          }
        }
        console.info('************* selectionfwk_panel_moveToGlobalDisplay_002 Test end*************');
        done();
      }
    });

    /**
     * @tc.name   selectionfwk_panel_hide_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_0700
     * @tc.desc   verify hide errorcode 33600002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('selectionfwk_panel_hide_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_panel_hide_001 Test start*************');
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
        if (panel !== undefined) {
          await selectionManager.destroyPanel(panel);
          bDestroyed = true;
          await panel.hide();
          expect(false).assertTrue();
        }
      } catch (error) {
        console.info(`selectionfwk_panel_hide_001 throw error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(33600002);
      } finally {
        if (!bDestroyed) {
          if (panel !== undefined) {
              await selectionManager.destroyPanel(panel);
          }
        }
        console.info('************* selectionfwk_panel_hide_001 Test end*************');
        done();
      }
    });

    /**
     * @tc.name   selectionfwk_panel_startmoving_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_0800
     * @tc.desc   verify startmoving errorcode 33600002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('selectionfwk_panel_startmoving_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_panel_startmoving_001 Test start*************');
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
        if (panel !== undefined) {
            await selectionManager.destroyPanel(panel);
            bDestroyed = true;
            await panel.startMoving();
            expect(false).assertTrue();
        }
      } catch (error) {
        console.info(`selectionfwk_panel_startmoving_001 throw error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(33600002);
      } finally {
        if (!bDestroyed) {
            if (panel !== undefined) {
                await selectionManager.destroyPanel(panel);
            }
        }
        console.info('************* selectionfwk_panel_startmoving_001 Test end*************');
        done();
      }
    });

    /**
     * @tc.name   selectionfwk_panel_show_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_0900
     * @tc.desc   verify panel show errorcode 33600002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('selectionfwk_panel_show_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_panel_show_001 Test start*************');
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
        if (panel !== undefined) {
            await selectionManager.destroyPanel(panel);
            bDestroyed = true;
            await panel.show();
            expect(false).assertTrue();
        }
      } catch (error) {
        console.info(`selectionfwk_panel_show_001 throw error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(33600002);
      } finally {
        if (!bDestroyed) {
          if (panel !== undefined) {
            await selectionManager.destroyPanel(panel);
          }
        }
        console.info('************* selectionfwk_panel_show_001 Test end*************');
        done();
      }
    });

    /**
     * @tc.name   selectionfwk_destroyPanel_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_1000
     * @tc.desc   verify destroyPanel result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_destroyPanel_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_destroyPanel_001 Test start*************');
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
        if (panel !== undefined) {
          await selectionManager.destroyPanel(panel);
          console.info(`selectionfwk_destroyPanel_001 promise success`);
          console.info('************* selectionfwk_destroyPanel_001 Test end*************');
          done();
        }
      } catch (error) {
        console.info(`selectionfwk_destroyPanel_001 throw error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        console.info('************* selectionfwk_destroyPanel_001 Test end*************');
        done();
      }
    });

    /**
     * @tc.name   selectionfwk_panel_on_destroyed_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_1100
     * @tc.desc   verify panel on destroyPanel result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_panel_on_destroyed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_panel_on_destroyed_001*************');
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
        if (panel !== undefined) {
          panel.onDestroy(()=>{
              console.info(`selectionfwk_panel_on_destroyed_001`);
          });
        }
      } catch(error) {
        console.info(`selectionfwk_panel_on_destroyed_001 throw error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      } finally {
        if (panel !== undefined) {
          await selectionManager.destroyPanel(panel);
        }
        console.info('************* selectionfwk_panel_on_destroyed_001 Test end*************');
        done()
      }
    });

    /**
     * @tc.name   selectionfwk_panel_off_destroyed_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_1200
     * @tc.desc   verify panel off destroyPanel result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_panel_off_destroyed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_panel_off_destroyed_001*************');
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
        if (panel !== undefined) {
          panel.onDestroy(() => {
              console.info('selectionfwk_panel_off_destroyed_001 callback enter');
          });
          panel.offDestroy();
          await selectionManager.destroyPanel(panel);
          panel = undefined;
        }
      } catch(error) {
        console.info(`selectionfwk_destroyPanel_001 throw error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      } finally {
        if (panel !== undefined) {
          await selectionManager.destroyPanel(panel);
        }
        console.info('************* selectionfwk_panel_off_destroyed_001 Test end*************');
        done();
      }
    });

    /**
     * @tc.name   selectionfwk_panel_offdestroyed_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_3800
     * @tc.desc   verify panel offDestroy result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_panel_offdestroyed_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_panel_offdestroyed_001*************');
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
      let onPanelDestroyCallback = () => {
        console.info('panel has destroy.');
      };
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        if (panel !== undefined) {
          panel.onDestroy(onPanelDestroyCallback);
          panel.offDestroy(onPanelDestroyCallback);
        }
      } catch(error) {
        console.info(`selectionfwk_destroyPanel_001 throw error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      } finally {
        if (panel !== undefined) {
          await selectionManager.destroyPanel(panel);
        }
        console.info('************* selectionfwk_panel_offdestroyed_001 Test end*************');
        done();
      }
    });

    /**
     * @tc.name   selectionfwk_panel_on_hidden_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_1300
     * @tc.desc   verify panel on hidden result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_panel_on_hidden_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_panel_on_hidden_001*************');
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
        if (panel !== undefined) {
          panel.onHide(()=>{
            console.info(`selectionfwk_panel_on_hidden_001`);
          })
        }
      } catch(error) {
        console.info(`selectionfwk_panel_on_hidden_001 throw error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
      } finally {
        if (panel !== undefined) {
          await selectionManager.destroyPanel(panel);
        }
        console.info('************* selectionfwk_panel_on_hidden_001 Test end*************');
        done();
      }
    });

    /**
     * @tc.name   selectionfwk_panel_off_hidden_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_1400
     * @tc.desc   verify panel off hidden result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_panel_off_hidden_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_panel_off_hidden_001*************');
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
        if (panel !== undefined) {
          panel.onHide(()=>{});
          panel.offHide();
        }
      } catch(error) {
        console.info(`selectionfwk_panel_off_hidden_001 throw error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      } finally {
        if (panel !== undefined) {
          await selectionManager.destroyPanel(panel);
        }
        console.info('************* selectionfwk_panel_off_hidden_001 Test end*************');
        done();
      }
    });

    /**
     * @tc.name   selectionfwk_panel_off_hidden_002
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_3900
     * @tc.desc   verify panel off hidden result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_panel_off_hidden_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_panel_off_hidden_002*************');
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
      let onPanelHideCallback = () => {
        console.info('panel has Hide.');
      };
      try {
        panel = await selectionManager.createPanel(context, panelInfo);
        if (panel !== undefined) {
          panel.onHide(onPanelHideCallback);
          panel.offHide(onPanelHideCallback);
        }
      } catch(error) {
        console.info(`selectionfwk_panel_off_hidden_002 throw error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
      } finally {
        if (panel !== undefined) {
          await selectionManager.destroyPanel(panel);
        }
        console.info('************* selectionfwk_panel_off_hidden_002 Test end*************');
        done();
      }
    });

    /**
     * @tc.name   selectionfwk_SelectionInfo_002
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_1600
     * @tc.desc   verify SelectionInfo selectionType  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_SelectionInfo_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_SelectionInfo_002 Test start*************');
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
      console.info('************* selectionfwk_SelectionInfo_002 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_SelectionInfo_003
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_1700
     * @tc.desc   verify SelectionInfo startDisplayX  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_SelectionInfo_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_SelectionInfo_003 Test start*************');
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
      console.info('************* selectionfwk_SelectionInfo_003 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_SelectionInfo_004
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_1800
     * @tc.desc   verify SelectionInfo startDisplayY  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_SelectionInfo_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_SelectionInfo_004 Test start*************');
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
      expect(sel.startDisplayY == 10).assertTrue();
      console.info('************* selectionfwk_SelectionInfo_004 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_SelectionInfo_005
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_1900
     * @tc.desc   verify SelectionInfo endDisplayX  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_SelectionInfo_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_SelectionInfo_005 Test start*************');
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
      expect(sel.endDisplayX == 510).assertTrue();
      console.info('************* selectionfwk_SelectionInfo_005 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_SelectionInfo_006
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_2000
     * @tc.desc   verify SelectionInfo endDisplayY  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_SelectionInfo_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_SelectionInfo_006 Test start*************');
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
      expect(sel.endDisplayY == 610).assertTrue();
      console.info('************* selectionfwk_SelectionInfo_006 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_SelectionInfo_007
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_2100
     * @tc.desc   verify SelectionInfo startWindowX  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_SelectionInfo_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_SelectionInfo_007 Test start*************');
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
      expect(sel.startWindowX == 0).assertTrue();
      console.info('************* selectionfwk_SelectionInfo_007 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_SelectionInfo_008
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_2200
     * @tc.desc   verify SelectionInfo startWindowY  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_SelectionInfo_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_SelectionInfo_008 Test start*************');
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
      expect(sel.startWindowY == 0).assertTrue();
      console.info('************* selectionfwk_SelectionInfo_008 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_SelectionInfo_009
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_2300
     * @tc.desc   verify SelectionInfo endWindowX  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_SelectionInfo_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_SelectionInfo_009 Test start*************');
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
      expect(sel.endWindowX == 500).assertTrue();
      console.info('************* selectionfwk_SelectionInfo_009 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_SelectionInfo_010
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_2400
     * @tc.desc   verify SelectionInfo endWindowY  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_SelectionInfo_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_SelectionInfo_010 Test start*************');
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
      expect(sel.endWindowY == 600).assertTrue();
      console.info('************* selectionfwk_SelectionInfo_010 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_SelectionInfo_011
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_2500
     * @tc.desc   verify SelectionInfo displayID  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_SelectionInfo_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_SelectionInfo_011 Test start*************');
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
      expect(sel.displayID == 100).assertTrue();
      console.info('************* selectionfwk_SelectionInfo_011 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_SelectionInfo_012
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_2600
     * @tc.desc   verify SelectionInfo windowID  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_SelectionInfo_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_SelectionInfo_012 Test start*************');
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
      expect(sel.windowID == 101).assertTrue();
      console.info('************* selectionfwk_SelectionInfo_012 Test end*************');
      done();
    });

   /**
     * @tc.name   selectionfwk_SelectionInfo_013
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_2700
     * @tc.desc   verify SelectionInfo bundleName  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_SelectionInfo_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_SelectionInfo_013 Test start*************');
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
      expect(sel.bundleName == "com.acts.selection.test").assertTrue();
      console.info('************* selectionfwk_SelectionInfo_013 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_SelectionInfo_014
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_2800
     * @tc.desc   verify selectionType DOUBLE_CLICK  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_SelectionInfo_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_SelectionInfo_014 Test start*************');
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
      console.info('************* selectionfwk_SelectionInfo_014 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_SelectionInfo_015
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_2900
     * @tc.desc   verify selectionType TRIPLE_CLICK  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_SelectionInfo_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_SelectionInfo_015 Test start*************');
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
      console.info('************* selectionfwk_SelectionInfo_015 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_PanelInfo_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_3000
     * @tc.desc   verify MENU_PANEL  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_PanelInfo_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_PanelInfo_001 Test start*************');
      let panel : PanelInfo = {
        panelType: PanelType.MENU_PANEL,
        x: 10,
        y: 10,
        width: 400,
        height: 600
      }
      expect(panel.panelType == PanelType.MENU_PANEL).assertTrue();
      console.info('************* selectionfwk_PanelInfo_001 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_PanelInfo_002
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_3100
     * @tc.desc   verify MAIN_PANEL  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_PanelInfo_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_PanelInfo_002 Test start*************');
      let panel : PanelInfo = {
        panelType: PanelType.MAIN_PANEL,
        x: 10,
        y: 10,
        width: 400,
        height: 600
      }
      expect(panel.panelType == PanelType.MAIN_PANEL).assertTrue();
      console.info('************* selectionfwk_PanelInfo_002 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_PanelInfo_003
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_3200
     * @tc.desc   verify panel x  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_PanelInfo_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_PanelInfo_003 Test start*************');
      let panel : PanelInfo = {
        panelType: PanelType.MENU_PANEL,
        x: 10,
        y: 10,
        width: 400,
        height: 600
      }
      expect(panel.x == 10).assertTrue();
      console.info('************* selectionfwk_PanelInfo_003 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_PanelInfo_004
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_3300
     * @tc.desc   verify panel y  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_PanelInfo_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_PanelInfo_004 Test start*************');
      let panel : PanelInfo = {
        panelType: PanelType.MENU_PANEL,
        x: 10,
        y: 10,
        width: 400,
        height: 600
      }
      expect(panel.y == 10).assertTrue();
      console.info('************* selectionfwk_PanelInfo_004 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_PanelInfo_005
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_3400
     * @tc.desc   verify panel width  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_PanelInfo_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_PanelInfo_005 Test start*************');
      let panel : PanelInfo = {
        panelType: PanelType.MENU_PANEL,
        x: 10,
        y: 10,
        width: 400,
        height: 600
      }
      expect(panel.width == 400).assertTrue();
      console.info('************* selectionfwk_PanelInfo_005 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_PanelInfo_006
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_3500
     * @tc.desc   verify panel height  result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_PanelInfo_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_PanelInfo_006 Test start*************');
      let panel : PanelInfo = {
        panelType: PanelType.MENU_PANEL,
        x: 10,
        y: 10,
        width: 400,
        height: 600
      }
      expect(panel.height == 600).assertTrue();
      console.info('************* selectionfwk_PanelInfo_006 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_GetSelectionContent_001
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_4000
     * @tc.desc   verify GetSelectionContent errcode 33600005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_GetSelectionContent_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_GetSelectionContent_001 Test start*************');
      try {
        let content: string = await selectionManager.getSelectionContent();
        expect(typeof(content)).assertEqual('string');
        expect().assertFail();
      } catch (error) {
        console.info(`selectionfwk_GetSelectionContent_001 throw error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(33600005);
      }
      await Utils.msSleep(500);
      console.info('************* selectionfwk_GetSelectionContent_001 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_GetSelectionContent_002
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_4100
     * @tc.desc   verify GetSelectionContent errcode 33600004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_GetSelectionContent_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_GetSelectionContent_002 Test start*************');
      for (let i = 0; i < 50; ++i) {
        try {
          let content: string = await selectionManager.getSelectionContent();
          expect().assertFail();
        } catch (error) {
          console.info(`selectionfwk_GetSelectionContent_002 throw error: [${error.code}, ${error.message}]`);
          expect(error.code).assertEqual(33600005);
        }
      }
      try {
        let content: string = await selectionManager.getSelectionContent();
        expect().assertFail();
      } catch (error) {
        console.info(`selectionfwk_GetSelectionContent_002 throw error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(33600004);
      }
      await Utils.msSleep(500);
      console.info('************* selectionfwk_GetSelectionContent_002 Test end*************');
      done();
    });

    /**
     * @tc.name   selectionfwk_GetSelectionContent_003
     * @tc.number SUB_Driver_Seletion_StaticAPIFunc_4200
     * @tc.desc   verify GetSelectionContent errcode 33600005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectionfwk_GetSelectionContent_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('************* selectionfwk_GetSelectionContent_003 Test start*************');
      for (let i = 0; i < 50; ++i) {
        try {
          let content: string = await selectionManager.getSelectionContent();
          expect().assertFail();
        } catch (error) {
          console.info(`selectionfwk_GetSelectionContent_003 throw error: [${error.code}, ${error.message}]`);
          expect(error.code).assertEqual(33600005);
        }
      }
      await Utils.msSleep(500);
      try {
        let content: string = await selectionManager.getSelectionContent();
        expect().assertFail();
      } catch (error) {
        console.info(`selectionfwk_GetSelectionContent_003 throw error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(33600005);
      }
      await Utils.msSleep(500);
      console.info('************* selectionfwk_GetSelectionContent_003 Test end***`**********');
      done();
    });
  })
}