import { describe, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { DisplayRotation, MatchPattern, ResizeDirection, UiDirection, WindowMode, MouseButton  } from '@ohos.UiTest'


const TestTag = 'uitestEnumTest';


export default function uitestEnumTest() {
  describe('uitestEnumTest', () => {

    /**
     * @tc.name   test_MatchPattern
     * @tc.number uitestEnumTest_001
     * @tc.desc   MatchPattern test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_MatchPattern', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_MatchPattern start`);
      expect(MatchPattern.EQUALS).assertEqual(0);
      expect(MatchPattern.CONTAINS).assertEqual(1);
      expect(MatchPattern.STARTS_WITH).assertEqual(2);
      expect(MatchPattern.ENDS_WITH).assertEqual(3);
      expect(MatchPattern.REG_EXP).assertEqual(4);
      expect(MatchPattern.REG_EXP_ICASE).assertEqual(5);
      console.log(`${TestTag}, test_MatchPattern end`);
    })

    /**
     * @tc.name   test_WindowMode
     * @tc.number uitestEnumTest_002
     * @tc.desc   WindowMode test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_WindowMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_WindowMode start`);
      expect(WindowMode.FULLSCREEN).assertEqual(0);
      expect(WindowMode.PRIMARY).assertEqual(1);
      expect(WindowMode.SECONDARY).assertEqual(2);
      expect(WindowMode.FLOATING).assertEqual(3);
      console.log(`${TestTag}, test_WindowMode end`);
    })

    /**
     * @tc.name   test_ResizeDirection
     * @tc.number uitestEnumTest_003
     * @tc.desc   ResizeDirection test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_ResizeDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_ResizeDirection start`);
      expect(ResizeDirection.LEFT).assertEqual(0);
      expect(ResizeDirection.RIGHT).assertEqual(1);
      expect(ResizeDirection.UP).assertEqual(2);
      expect(ResizeDirection.DOWN).assertEqual(3);
      expect(ResizeDirection.LEFT_UP).assertEqual(4);
      expect(ResizeDirection.LEFT_DOWN).assertEqual(5);
      expect(ResizeDirection.RIGHT_UP).assertEqual(6);
      expect(ResizeDirection.RIGHT_DOWN).assertEqual(7);
      console.log(`${TestTag}, test_ResizeDirection end`);
    })

    /**
     * @tc.name   test_DisplayRotation
     * @tc.number uitestEnumTest_004
     * @tc.desc   DisplayRotation test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_DisplayRotation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_DisplayRotation start`);
      expect(DisplayRotation.ROTATION_0).assertEqual(0);
      expect(DisplayRotation.ROTATION_90).assertEqual(1);
      expect(DisplayRotation.ROTATION_180).assertEqual(2);
      expect(DisplayRotation.ROTATION_270).assertEqual(3);
      console.log(`${TestTag}, test_DisplayRotation end`);
    })

    /**
     * @tc.name   test_UiDirection
     * @tc.number uitestEnumTest_005
     * @tc.desc   UiDirection test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UiDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_UiDirection start`);
      expect(UiDirection.LEFT).assertEqual(0);
      expect(UiDirection.RIGHT).assertEqual(1);
      expect(UiDirection.UP).assertEqual(2);
      expect(UiDirection.DOWN).assertEqual(3);
      console.log(`${TestTag}, test_UiDirection end`);
    })

    /**
     * @tc.name   test_MouseButton
     * @tc.number uitestEnumTest_006
     * @tc.desc   MouseButton test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_MouseButton', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, test_MouseButton start`);
      expect(MouseButton.MOUSE_BUTTON_LEFT).assertEqual(0);
      expect(MouseButton.MOUSE_BUTTON_RIGHT).assertEqual(1);
      expect(MouseButton.MOUSE_BUTTON_MIDDLE).assertEqual(2);
      console.log(`${TestTag}, test_MouseButton end`);
    })
  })
}