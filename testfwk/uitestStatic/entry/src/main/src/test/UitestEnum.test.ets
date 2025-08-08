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
import { beforeAll, describe, it, expect,TestType, Size, Level } from "../../../hypium/index"
import { Component, Driver, ON, On, MatchPattern, MouseButton,ResizeDirection, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation } from '@ohos.UiTest'
import  hilog  from '@ohos.hilog'
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const waitUiReadyMs : number = 1000;
const DeviceErrorCode = 17000005;


async function exitInputMethod() {
  let driver = Driver.create()
  let softKeyBoard = await driver.findComponent(ON.type('Canvas'))
  if (softKeyBoard != null) {
    await driver.pressBack()
  }
}

function sleep(numberMillis: int) {
  const exitTime = new Date().getTime() + numberMillis;
  while (new Date().getTime() < exitTime) { }
  return
}

export default function uitestEnumTest() {
  describe('uitestEnumTestStatic', (): void => {
    beforeAll(async () : Promise<void> => {
      hilog.info(domain, tag, "uitestEnumTest loadup start!!!!!");
      hilog.info(domain, tag, "uitestEnumTest loadup over!!!!!")
    })

    /*
   * @tc.number: uitestEnumTest_001
   * @tc.name: testWindowModeEnum_static
   * @tc.desc: MatchPattern test.
   */
    it('testWindowModeEnum_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      hilog.info(domain, tag, `testWindowModeEnum_static start `);
      hilog.info(domain, tag, `WindowMode.FULLSCREEN is: ${WindowMode.FULLSCREEN}`);
      hilog.info(domain, tag, `WindowMode.PRIMARY is: ${WindowMode.PRIMARY}`);
      hilog.info(domain, tag, `WindowMode.SECONDARY is: ${WindowMode.SECONDARY}`);
      hilog.info(domain, tag, `WindowMode.FLOATING is: ${WindowMode.FLOATING}`);
      expect(JSON.stringify(WindowMode.FULLSCREEN)).assertEqual('0');
      expect(JSON.stringify(WindowMode.PRIMARY)).assertEqual('1');
      expect(JSON.stringify(WindowMode.SECONDARY)).assertEqual('2');
      expect(JSON.stringify(WindowMode.FLOATING)).assertEqual('3');
      hilog.info(domain, tag, `testWindowModeEnum_static end `);
    })

    /*
     * @tc.number: uitestEnumTest_002
     * @tc.name: testUiDirectionEnum_static
     * @tc.desc: MatchPattern test.
     */
    it('testUiDirectionEnum_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      hilog.info(domain, tag, `testUiDirectionEnum_static start `);
      hilog.info(domain, tag, `UiDirection.LEFT is: ${UiDirection.LEFT}`);
      hilog.info(domain, tag, `WindowMode.RIGHT is: ${UiDirection.RIGHT}`);
      hilog.info(domain, tag, `UiDirection.UP is: ${UiDirection.UP}`);
      hilog.info(domain, tag, `UiDirection.DOWN is: ${UiDirection.DOWN}`);
      expect(JSON.stringify(UiDirection.LEFT)).assertEqual('0');
      expect(JSON.stringify(UiDirection.RIGHT)).assertEqual('1');
      expect(JSON.stringify(UiDirection.UP)).assertEqual('2');
      expect(JSON.stringify(UiDirection.DOWN)).assertEqual('3');
      hilog.info(domain, tag, `testUiDirectionEnum_static end `);
    })

    /*
     * @tc.number: uitestEnumTest_003
     * @tc.name: testResizeDirectionEnum_static
     * @tc.desc: MatchPattern test.
     */
    it('testResizeDirectionEnum_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      hilog.info(domain, tag, `testResizeDirectionEnum_static start `);
      hilog.info(domain, tag, `ResizeDirection.LEFT is: ${ResizeDirection.LEFT}`);
      hilog.info(domain, tag, `ResizeDirection.RIGHT is: ${ResizeDirection.RIGHT}`);
      hilog.info(domain, tag, `ResizeDirection.UP is: ${ResizeDirection.UP}`);
      hilog.info(domain, tag, `ResizeDirection.DOWN is: ${ResizeDirection.DOWN}`);
      hilog.info(domain, tag, `ResizeDirection.LEFT_UP is: ${ResizeDirection.LEFT_UP}`);
      hilog.info(domain, tag, `ResizeDirection.LEFT_DOWN is: ${ResizeDirection.LEFT_DOWN}`);
      hilog.info(domain, tag, `ResizeDirection.RIGHT_UP is: ${ResizeDirection.RIGHT_UP}`);
      hilog.info(domain, tag, `ResizeDirection.RIGHT_DOWN is: ${ResizeDirection.RIGHT_DOWN}`);
      expect(ResizeDirection.LEFT + '').assertEqual('0');
      expect(ResizeDirection.RIGHT + '').assertEqual('1');
      expect(ResizeDirection.UP + '').assertEqual('2');
      expect(ResizeDirection.DOWN + '').assertEqual('3');
      expect(ResizeDirection.LEFT_UP + '').assertEqual('4');
      expect(ResizeDirection.LEFT_DOWN + '').assertEqual('5');
      expect(ResizeDirection.RIGHT_UP + '').assertEqual('6');
      expect(ResizeDirection.RIGHT_DOWN + '').assertEqual('7');
      hilog.info(domain, tag, `testResizeDirectionEnum_static end `);
    })


    /*
     * @tc.number: uitestEnumTest_004
     * @tc.name: testMouseButtonEnum_static
     * @tc.desc: MatchPattern test.
     */
    it('testMouseButtonEnum_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      hilog.info(domain, tag, `testMouseButtonEnum_static start `);
      hilog.info(domain, tag, `MouseButton.MOUSE_BUTTON_LEFT is: ${MouseButton.MOUSE_BUTTON_LEFT}`);
      hilog.info(domain, tag, `MouseButton.MOUSE_BUTTON_RIGHT is: ${MouseButton.MOUSE_BUTTON_RIGHT}`);
      hilog.info(domain, tag, `MouseButton.MOUSE_BUTTON_MIDDLE is: ${MouseButton.MOUSE_BUTTON_MIDDLE}`);
      expect(JSON.stringify(MouseButton.MOUSE_BUTTON_LEFT)).assertEqual('0');
      expect(JSON.stringify(MouseButton.MOUSE_BUTTON_RIGHT)).assertEqual('1');
      expect(JSON.stringify(MouseButton.MOUSE_BUTTON_MIDDLE)).assertEqual('2');
      hilog.info(domain, tag, `testMouseButtonEnum_static end `);
    })

    /*
     * @tc.number: uitestEnumTest_005
     * @tc.name: testMatchPatternEnum_static
     * @tc.desc: MatchPattern test.
     */
    it('testMatchPatternEnum_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      hilog.info(domain, tag, `testMatchPatternEnum_static start `);
      hilog.info(domain, tag, `MatchPattern.EQUALS is: ${MatchPattern.EQUALS}`);
      hilog.info(domain, tag, `MatchPattern.CONTAINS is: ${MatchPattern.CONTAINS}`);
      hilog.info(domain, tag, `MatchPattern.STARTS_WITH is: ${MatchPattern.STARTS_WITH}`);
      hilog.info(domain, tag, `MatchPattern.ENDS_WITH is: ${MatchPattern.ENDS_WITH}`);
      hilog.info(domain, tag, `MatchPattern.REG_EXP is: ${MatchPattern.REG_EXP}`);
      hilog.info(domain, tag, `MatchPattern.REG_EXP_ICASE is: ${MatchPattern.REG_EXP_ICASE}`);
      expect(JSON.stringify(MatchPattern.EQUALS)).assertEqual('0');
      expect(JSON.stringify(MatchPattern.CONTAINS)).assertEqual('1');
      expect(JSON.stringify(MatchPattern.STARTS_WITH)).assertEqual('2');
      expect(JSON.stringify(MatchPattern.ENDS_WITH)).assertEqual('3');
      expect(JSON.stringify(MatchPattern.REG_EXP)).assertEqual('4');
      expect(JSON.stringify(MatchPattern.REG_EXP_ICASE)).assertEqual('5');
      hilog.info(domain, tag, `testMatchPatternEnum_static end `);
    })

    /*
     * @tc.number: uitestEnumTest_006
     * @tc.name: testDisplayRotationEnum_static
     * @tc.desc: MatchPattern test.
     */
    it('testDisplayRotationEnum_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      hilog.info(domain, tag, `testDisplayRotationEnum_static start `);
      hilog.info(domain, tag, `DisplayRotation.ROTATION_0 is: ${DisplayRotation.ROTATION_0}`);
      hilog.info(domain, tag, `DisplayRotation.ROTATION_90 is: ${DisplayRotation.ROTATION_90}`);
      hilog.info(domain, tag, `DisplayRotation.ROTATION_180 is: ${DisplayRotation.ROTATION_180}`);
      hilog.info(domain, tag, `DisplayRotation.ROTATION_270 is: ${DisplayRotation.ROTATION_270}`);
      expect(JSON.stringify(DisplayRotation.ROTATION_0)).assertEqual('0');
      expect(JSON.stringify(DisplayRotation.ROTATION_90)).assertEqual('1');
      expect(JSON.stringify(DisplayRotation.ROTATION_180)).assertEqual('2');
      expect(JSON.stringify(DisplayRotation.ROTATION_270)).assertEqual('3');
      hilog.info(domain, tag, `testDisplayRotationEnum_static end `);
    })
  })
}