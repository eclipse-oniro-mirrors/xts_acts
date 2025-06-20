/**
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, it, expect } from "@ohos/hypium"
import { name } from './exportTest/exportTest'
import { variableName } from './exportTest/exportTest'
import { variableA } from './exportTest/exportTest'
import { variableB } from './exportTest/aggregator'
import { ModuleA } from './exportTest/aggregatorObj'
import { ModuleB } from './exportTest/index'

export default function staticExport() {
  describe('StaticExportTest', () => {
    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_EXPORT_0100
     * @tc.name      : testStaticExport01
     * @tc.desc      : Static export test, directly exporting using export {}.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testStaticExport01', 0, () => {
      const caseName: string = "testStaticExport01";
      try {
        expect(name).assertEqual("name");
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_EXPORT_0200
     * @tc.name      : testStaticExport02
     * @tc.desc      : Static export test, indirectly exporting using export {}.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testStaticExport02', 0, () => {
      const caseName: string = "testStaticExport02";
      try {
        expect(variableName).assertEqual("name");
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_EXPORT_0300
     * @tc.name      : testStaticExport03
     * @tc.desc      : Static export test, directly exporting using export *.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testStaticExport03', 0, () => {
      const caseName: string = "testStaticExport03";
      try {
        expect(variableA).assertEqual("Variable A");
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_EXPORT_0400
     * @tc.name      : testStaticExport04
     * @tc.desc      : Static export test, indirectly exporting using export *.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testStaticExport04', 0, () => {
      const caseName: string = "testStaticExport04";
      try {
        expect(variableB).assertEqual("Variable B");
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_EXPORT_0500
     * @tc.name      : testStaticExport05
     * @tc.desc      : Static export test, directly exporting using export * as obj.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testStaticExport05', 0, () => {
      const caseName: string = "testStaticExport05";
      try {
        expect(ModuleA.variableA).assertEqual("Variable A");
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_COMPILER_RUNTIME_STATIC_EXPORT_0600
     * @tc.name      : testStaticExport06
     * @tc.desc      : Static export test, indirectly exporting using export * as obj.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testStaticExport06', 0, () => {
      const caseName: string = "testStaticExport06";
      try {
        expect(ModuleB.variableB).assertEqual("Variable B");
      } catch (error) {
        console.error(`${caseName} catch error: ${error}`);
        expect().assertFail();
      }
    })
  })
}