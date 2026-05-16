/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import termios from 'libtermiosndk.so'

export default function termiosNdkTest() {
  describe('MuslTermiosTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslTermiosTcdrain001
     * @tc.number SUB_THIRDPARTY_MUSL_TERMIOS_TCDRAIN_0100
     * @tc.desc   test tcdrain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTermiosTcdrain001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c:number = termios.tcdrain(0);
      expect(c).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslTermiosTcflow001
     * @tc.number SUB_THIRDPARTY_MUSL_TERMIOS_TCFLOW_0100
     * @tc.desc   test tcflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTermiosTcflow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c:number = termios.tcflow(0);
      expect(c).assertEqual(-1);
      done()
    });
    /**
     * @tc.name   testMuslTermiosTcflush001
     * @tc.number SUB_THIRDPARTY_MUSL_TERMIOS_TCFLUSH_0100
     * @tc.desc   test tcflush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTermiosTcflush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c:number = termios.tcflush(0);
      expect(c).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslTermiosTcgetattr001
     * @tc.number SUB_THIRDPARTY_MUSL_TERMIOS_TCGETATTR_0100
     * @tc.desc   test tcgetattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTermiosTcgetattr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c:number = termios.tcgetattr(0);
      expect(c).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslTermiosTcgetsid001
     * @tc.number SUB_THIRDPARTY_MUSL_TERMIOS_TCGETSID_0100
     * @tc.desc   test tcgetsid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTermiosTcgetsid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c:number = termios.tcgetsid(0);
      expect(c).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslTermiosTcsendbreak001
     * @tc.number SUB_THIRDPARTY_MUSL_TERMIOS_TCSENDBREAK_0100
     * @tc.desc   test tcsendbreak
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTermiosTcsendbreak001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c:number = termios.tcsendbreak(0);
      expect(c).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslTermiosTcsetattr001
     * @tc.number SUB_THIRDPARTY_MUSL_TERMIOS_SETATTR_0100
     * @tc.desc   test tcsetattr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTermiosTcsetattr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c:number = termios.tcsetattr(0);
      expect(c).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslTermiosCfsetispeed001
     * @tc.number SUB_THIRDPARTY_MUSL_TERMIOS_CFSETISPEDD_0100
     * @tc.desc   test cfsetispeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTermiosCfsetispeed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 0;
      let result: number = termios.cfsetispeed();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslTermiosCfsetospeed001
     * @tc.number SUB_THIRDPARTY_MUSL_TERMIOS_CFSETOSPEDD_0100
     * @tc.desc   test cfsetospeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTermiosCfsetospeed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 0;
      let result: number = termios.cfsetospeed();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslTermiosCfsetspeed001
     * @tc.number SUB_THIRDPARTY_MUSL_TERMIOS_CFSETSPEDD_0100
     * @tc.desc   test cfsetspeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTermiosCfsetspeed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 0;
      let result: number = termios.cfsetspeed();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslTermiosCfgetispeed001
     * @tc.number SUB_THIRDPARTY_MUSL_TERMIOS_CFGETISPEDD_0100
     * @tc.desc   test cfgetispeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTermiosCfgetispeed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 1;
      let result: number = termios.cfgetispeed();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.name   testMuslTermiosCfmakeraw001
     * @tc.number SUB_THIRDPARTY_MUSL_TERMIOS_CFMAKERAW_0100
     * @tc.desc   test cfmakeraw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTermiosCfmakeraw001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 1;
      let result: number = termios.cfmakeraw();
      expect(result).assertEqual(resultTrue);
      done()
    });
  });
}
