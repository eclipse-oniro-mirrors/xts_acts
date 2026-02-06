/*
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium'
import nativerenderndk from 'libnoderenderndk.so'
import Utils from '../common/Utils';

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_PARAM_INVALID = 401;
const ARKUI_ERROR_CODE_ERROR = 1;

export default function NodeAdapterTest() {
  describe('NodeAdapterTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`nodeadapter/nodeadapterTest`, done);
    });
    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterSetTotalNodeCount_0100
       * @tc.name       : testOHArkUINodeAdapterSetTotalNodeCount0100
       * @tc.desc       : testing OH_ArkUI_NodeAdapter_SetTotalNodeCount  interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUINodeAdapterSetTotalNodeCount0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterSetTotalNodeCount0100 start====");
          await Utils.sleep(5000)
          let result: number = nativerenderndk.SetTotalNodeCountTest_001()
          console.info(`====>testOHArkUINodeAdapterSetTotalNodeCount0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterSetTotalNodeCount0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterSetTotalNodeCount_0200
       * @tc.name       : testOHArkUINodeAdapterSetTotalNodeCount0200
       * @tc.desc       : testing OH_ArkUI_NodeAdapter_SetTotalNodeCount  interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUINodeAdapterSetTotalNodeCount0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterSetTotalNodeCount0200 start====");
          let result: number = nativerenderndk.SetTotalNodeCountTest_002()
          console.info(`====>testOHArkUINodeAdapterSetTotalNodeCount0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterSetTotalNodeCount0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
        * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterRegisterEventReceiver_0100
        * @tc.name       : testOHArkUINodeAdapterRegisterEventReceiver0100
        * @tc.desc       : testing OH_ArkUI_NodeAdapter_RegisterEventReceiver  interface
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('testOHArkUINodeAdapterRegisterEventReceiver0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterRegisterEventReceiver0100 start====");
          let result: number = nativerenderndk.RegisterEventReceiverTest_001()
          console.info(`====>testOHArkUINodeAdapterRegisterEventReceiver0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterRegisterEventReceiver0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
      * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterReloadAllItems_0100
      * @tc.name       : testOHArkUINodeAdapterReloadAllItems0100
      * @tc.desc       : testing OH_ArkUI_NodeAdapter_ReloadAllItems interface
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testOHArkUINodeAdapterReloadAllItems0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterReloadAllItems0100 start====");
          let result: number = nativerenderndk.ReloadAllItemsTest_001()
          console.info(`====>testOHArkUINodeAdapterReloadAllItems0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterReloadAllItems0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })
    /*
      * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterReloadAllItems_0200
      * @tc.name       : testOHArkUINodeAdapterReloadAllItems0200
      * @tc.desc       : testing OH_ArkUI_NodeAdapter_ReloadAllItems interface
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testOHArkUINodeAdapterReloadAllItems0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterReloadAllItems0200 start====");
          let result: number = nativerenderndk.ReloadAllItemsTest_002()
          console.info(`====>testOHArkUINodeAdapterReloadAllItems0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterReloadAllItems0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
    * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterReloadItem_0100
    * @tc.name       : testOHArkUINodeAdapterReloadItem0100
    * @tc.desc       : testing OH_ArkUI_NodeAdapter_ReloadItem interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOHArkUINodeAdapterReloadItem0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterReloadItem0100 start====");
          let result: number = nativerenderndk.ReloadItemTest_001()
          console.info(`====>testOHArkUINodeAdapterReloadItem0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterReloadItem0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
     * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterReloadItem_0200
     * @tc.name       : testOHArkUINodeAdapterReloadItem0200
     * @tc.desc       : testing OH_ArkUI_NodeAdapter_ReloadItem interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHArkUINodeAdapterReloadItem0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterReloadItem0200 start====");
          let result: number = nativerenderndk.ReloadItemTest_002()
          console.info(`====>testOHArkUINodeAdapterReloadItem0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterReloadItem0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
   * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterRemoveItem_0100
   * @tc.name       : testOHArkUINodeAdapterRemoveItem0100
   * @tc.desc       : testing OH_ArkUI_NodeAdapter_RemoveItem interface
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('testOHArkUINodeAdapterRemoveItem0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterRemoveItem0100 start====");
          let result: number = nativerenderndk.RemoveItemTest_001()
          console.info(`====>testOHArkUINodeAdapterRemoveItem0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterRemoveItem0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
     * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterRemoveItem_0200
     * @tc.name       : testOHArkUINodeAdapterRemoveItem0200
     * @tc.desc       : testing OH_ArkUI_NodeAdapter_RemoveItem interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHArkUINodeAdapterRemoveItem0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterRemoveItem0200 start====");
          let result: number = nativerenderndk.RemoveItemTest_002()
          console.info(`====>testOHArkUINodeAdapterRemoveItem0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterRemoveItem0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
  * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterInsertItem_0100
  * @tc.name       : testOHArkUINodeAdapterInsertItem0100
  * @tc.desc       : testing OH_ArkUI_NodeAdapter_InsertItem interface
  * @tc.size       : MediumTest
  * @tc.type       : Function
  * @tc.level      : Level 1
  */
    it('testOHArkUINodeAdapterInsertItem0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterInsertItem0100 start====");
          let result: number = nativerenderndk.InsertItemTest_001()
          console.info(`====>testOHArkUINodeAdapterInsertItem0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterInsertItem0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
     * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterInsertItem_0200
     * @tc.name       : testOHArkUINodeAdapterInsertItem0200
     * @tc.desc       : testing OH_ArkUI_NodeAdapter_InsertItem interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHArkUINodeAdapterInsertItem0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterInsertItem0200 start====");
          let result: number = nativerenderndk.InsertItemTest_002()
          console.info(`====>testOHArkUINodeAdapterInsertItem0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterInsertItem0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
    * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterMoveItem_0100
    * @tc.name       : testOHArkUINodeAdapterMoveItem0100
    * @tc.desc       : testing OH_ArkUI_NodeAdapter_MoveItem interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOHArkUINodeAdapterMoveItem0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterMoveItem0100 start====");
          let result: number = nativerenderndk.MoveItemTest_001()
          console.info(`====>testOHArkUINodeAdapterMoveItem0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterMoveItem0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
     * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterMoveItem_0200
     * @tc.name       : testOHArkUINodeAdapterMoveItem0200
     * @tc.desc       : testing OH_ArkUI_NodeAdapter_MoveItem interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHArkUINodeAdapterMoveItem0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterMoveItem0200 start====");
          let result: number = nativerenderndk.MoveItemTest_002()
          console.info(`====>testOHArkUINodeAdapterMoveItem0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterMoveItem0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
    * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterGetAllItems_0100
    * @tc.name       : testOHArkUINodeAdapterGetAllItems0100
    * @tc.desc       : testing OH_ArkUI_NodeAdapter_GetAllItems interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOHArkUINodeAdapterGetAllItems0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterGetAllItems0100 start====");
          let result: number = nativerenderndk.GetAllItemsTest_001()
          console.info(`====>testOHArkUINodeAdapterGetAllItems0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterGetAllItems0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
     * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterGetAllItems_0200
     * @tc.name       : testOHArkUINodeAdapterGetAllItems0200
     * @tc.desc       : testing OH_ArkUI_NodeAdapter_GetAllItems interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHArkUINodeAdapterGetAllItems0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterGetAllItems0200 start====");
          let result: number = nativerenderndk.GetAllItemsTest_002()
          console.info(`====>testOHArkUINodeAdapterGetAllItems0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterGetAllItems0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
   * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterEventSetItem_0100
   * @tc.name       : testOHArkUINodeAdapterEventSetItem0100
   * @tc.desc       : testing OH_ArkUI_NodeAdapterEvent_SetItem interface
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('testOHArkUINodeAdapterEventSetItem0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterEventSetItem0100 start====");
          let result: number = nativerenderndk.SetItemTest_001()
          console.info(`====>testOHArkUINodeAdapterEventSetItem0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterEventSetItem0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
     * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterEventSetItem_0200
     * @tc.name       : testOHArkUINodeAdapterEventSetItem0200
     * @tc.desc       : testing OH_ArkUI_NodeAdapterEvent_SetItem interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHArkUINodeAdapterEventSetItem0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterEventSetItem0200 start====");
          let result: number = nativerenderndk.SetItemTest_002()
          console.info(`====>testOHArkUINodeAdapterEventSetItem0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterEventSetItem0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
   * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterEventSetNodeId_0100
   * @tc.name       : testOHArkUINodeAdapterEventSetNodeId0100
   * @tc.desc       : testing OH_ArkUI_NodeAdapterEvent_SetNodeId interface
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('testOHArkUINodeAdapterEventSetNodeId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterEventSetNodeId0100 start====");
          let result: number = nativerenderndk.SetNodeIdTest_001()
          console.info(`====>testOHArkUINodeAdapterEventSetNodeId0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterEventSetNodeId0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
     * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUINodeAdapterEventSetNodeId_0200
     * @tc.name       : testOHArkUINodeAdapterEventSetNodeId0200
     * @tc.desc       : testing OH_ArkUI_NodeAdapterEvent_SetNodeId interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHArkUINodeAdapterEventSetNodeId0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUINodeAdapterEventSetNodeId0200 start====");
          let result: number = nativerenderndk.SetNodeIdTest_002()
          console.info(`====>testOHArkUINodeAdapterEventSetNodeId0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUINodeAdapterEventSetNodeId0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

  })
}