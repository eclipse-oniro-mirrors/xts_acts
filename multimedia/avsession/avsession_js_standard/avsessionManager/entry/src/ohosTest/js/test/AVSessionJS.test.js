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

import avSession from '@ohos.multimedia.avsession';
import featureAbility from '@ohos.ability.featureAbility';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';


const TAG = "[AVSessionJSTest]";
export default function AVSessionJsTest() {
	describe("AVSessionJsTest", function () {
		let session = null;
		let controller = null;
		let receivedCallback = false;
		let receivedCallback2 = false;
		let receivedString = null;
		let receivedString2 = null;
		let receivedParam = null;
		let receivedParam2 = null;
		const INVALID_STRING = "invalid string";
		const UPDATE_LYRICS_EVENT = "dynamic_lyrics";
		const UPDATE_LYRICS_WANT_PARAMS = {
			lyric: "This is my lyrics"
		};
		const COMMON_COMMAND_STRING = "common_command";
		const COMMON_COMMAND_PARAMS = {
			command: "This is my command"
		};
		const CUSTOM_EXTRAS = {
			extras: "This is custom media packet"
		};

		beforeAll(async function () {
			session = await avSession.createAVSession(featureAbility.getContext(), "AVSessionDemo", 'audio').catch((err) => {
				console.error(TAG + "Create AVSession error " + JSON.stringify(err));
				expect().assertFail();
			});
			session.activate();
			controller = await session.getController();
			console.info(TAG + "Create session finished, beforeAll called");
		})

		afterAll(async function () {
			await session.destroy();
			console.info(TAG + 'afterAll called')
		})

		beforeEach(function () {
			console.info(TAG + 'beforeEach called')
		})

		afterEach(function () {
			console.info(TAG + 'afterEach called')
		})

		function sleep(time) {
			return new Promise((resolve) => setTimeout(resolve, time));
		}

		function commonCommandCallback1(command, args) {
			console.log(TAG + "Callback1 received event: " + JSON.stringify(command));
			console.log(TAG + "Callback1 received args: " + JSON.stringify(args));
			if (command != COMMON_COMMAND_STRING) {
				console.error(TAG + "Callback1 common command unmatch");
				expect().assertFail();
			}
			receivedCallback = true;
			receivedString = command;
			receivedParam = args;
		}

		function commonCommandCallback2(command, args) {
			console.log(TAG + "Callback2 received event: " + JSON.stringify(command));
			console.log(TAG + "Callback2 received args: " + JSON.stringify(args));
			if (command != COMMON_COMMAND_STRING) {
				console.error(TAG + "Callback2 common command unmatch");
				expect().assertFail();
			}
			receivedCallback2 = true;
			receivedString2 = command;
			receivedParam2 = args;
		}


  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0100
   * @tc.desc   Testing onCommonCommand callback
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			session.on('commonCommand', commonCommandCallback1);
			await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0100 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			sleep(200).then(() => {
				if (receivedCallback) {
					console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0100 Received common command");
					expect(receivedString == COMMON_COMMAND_STRING).assertTrue();
					expect(receivedParam.command == COMMON_COMMAND_PARAMS.command).assertTrue();
				} else {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0100 Common command not received");
					expect().assertFail();
				}
				receivedCallback = false;
				receivedString = null;
				receivedParam = null;
				done();
			})
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0200
   * @tc.desc   Testing onCommonCommand callback
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			let TAG = "[SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0200]";
			session.on('commonCommand', commonCommandCallback1);
			session.on('commonCommand', commonCommandCallback2);
			await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS).catch((err) => {
				console.error(TAG + "Send common command error " + JSON.stringify(err));
				expect().assertFail();
			});
			await sleep(200);
			console.info(`${TAG}Testlog:receivedCallback = ${receivedCallback}`);
			expect(receivedCallback).assertTrue();
			console.info(`${TAG}Testlog:receivedCallback2 = ${receivedCallback2}`);
			expect(receivedCallback2).assertTrue();
			console.log(TAG + "Received common command");
			console.info(`${TAG}Testlog:receivedString = ${receivedString}`);
			expect(receivedString).assertEqual(COMMON_COMMAND_STRING);
			console.info(`${TAG}Testlog:receivedParam.command = ${receivedParam.command}`);
			expect(receivedParam.command).assertEqual(COMMON_COMMAND_PARAMS.command);
			console.info(`${TAG}Testlog:receivedString2 = ${receivedString2}`);
			expect(receivedString2).assertEqual(COMMON_COMMAND_STRING);
			console.info(`${TAG}Testlog:receivedParam2.command = ${receivedParam2.command}`);
			expect(receivedParam2.command).assertEqual(COMMON_COMMAND_PARAMS.command)
			receivedCallback = false;
			receivedString = null;
			receivedParam = null;
			receivedCallback2 = false;
			receivedString2 = null;
			receivedParam2 = null;
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0100
   * @tc.desc   Testing offCommonCommand callback
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0100]";
			session.on('commonCommand', commonCommandCallback1);
			session.on('commonCommand', commonCommandCallback2);
			session.off('commonCommand', commonCommandCallback2);
			await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS).catch((err) => {
				console.error(TAG + "Send common command error" + JSON.stringify(err));
				expect().assertFail();
			});
			await sleep(200);
			console.info(`${TAG}Testlog:receivedCallback = ${receivedCallback}`);
			expect(receivedCallback).assertTrue();
			console.info(`${TAG}Testlog:receivedCallback2 = ${receivedCallback2}`);
			expect(receivedCallback2).assertFalse();
			console.log(TAG + "finished");
			console.info(`${TAG}Testlog:receivedString = ${receivedString}`);
			expect(receivedString).assertEqual(COMMON_COMMAND_STRING);
			console.info(`${TAG}Testlog:receivedParam.command = ${receivedParam.command}`);
			expect(receivedParam.command).assertEqual(COMMON_COMMAND_PARAMS.command);
			receivedCallback = false;
			receivedString = null;
			receivedParam = null;
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0200
   * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0200
   * @tc.desc   Testing offCommonCommand callback
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0200]";
			session.on('commonCommand', commonCommandCallback1);
			session.on('commonCommand', commonCommandCallback2);
			session.off('commonCommand', commonCommandCallback1);
			session.off('commonCommand', commonCommandCallback2);
			await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS).catch((err) => {
				console.error(TAG + "Send common command error" + JSON.stringify(err));
				expect().assertFail();
			});
			await sleep(200);
			console.info(`${TAG}Testlog:receivedCallback = ${receivedCallback}`);
			expect(receivedCallback).assertFalse();
			console.info(`${TAG}Testlog:receivedCallback2 = ${receivedCallback2}`);
			expect(receivedCallback2).assertFalse();
			console.log(TAG + "finished");
			receivedCallback = false;
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0300
   * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0300
   * @tc.desc   Testing offCommonCommand callback
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			let TAG = "[SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0300]";
			session.on('commonCommand', commonCommandCallback1);
			session.on('commonCommand', commonCommandCallback2);
			session.off('commonCommand');

			await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS).catch((err) => {
				console.error(TAG + "Send common command error" + JSON.stringify(err));
				expect().assertFail();
			});
			await sleep(200);
			console.info(`${TAG}Testlog:receivedCallback = ${receivedCallback}`);
			expect(receivedCallback).assertFalse();
			console.info(`${TAG}Testlog:receivedCallback2 = ${receivedCallback2}`);
			expect(receivedCallback2).assertFalse();
			console.log(TAG + "finished");
			receivedCallback = false;
			done();
		})

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICESYNC_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICESYNC_0100
   * @tc.desc   Testing call session getOutputDeviceSync(sync)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICESYNC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
			try {
				let outputDeviceInfo = session.getOutputDeviceSync();
				console.log(`Get output device info: ${outputDeviceInfo}`);
				expect(outputDeviceInfo.devices[0].deviceId).assertEqual("0");
			} catch (err) {
				expect().assertFail();
			}
			done();
		})

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0100
         * @tc.desc   Testing call session castDisplayChange(CastDisplayState.STATE_ON|CastDisplayState.STATE_OFF)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            const isExtendedDisplayCast = canIUse('SystemCapability.Multimedia.AVSession.ExtendedDisplayCast');
            if (isExtendedDisplayCast) {
                try {
                    session.on('castDisplayChange', (display) => {
                        if (display.state === avSession.CastDisplayState.STATE_ON) {
							let castDisplay = display
							if (typeof castDisplay.id === 'number'){
								console.info('castDisplay id type ture')
							} else {
								console.info(`castDisplay id type false`);
							}
                            console.info('castDisplayChange display : ${display.id} ON');
                        } else if (display.state === avSession.CastDisplayState.STATE_OFF) {
                            console.info('castDisplayChange display : ${display.id} OFF');
                        }
                    });
                } catch (err) {
                    expect(err.code).assertEqual(6600101);
                    console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0100 finished");
                }
                done();
            } else {
                console.info(`canIUse('SystemCapability.Multimedia.AVSession.ExtendedDisplayCast') false`);
                done();
            }
        })


        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0200
         * @tc.desc   Testing call session castDisplayChange()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            const isExtendedDisplayCast = canIUse('SystemCapability.Multimedia.AVSession.ExtendedDisplayCast');
            if (isExtendedDisplayCast) {
                try {
                    session.on('castDisplayChange', (display) => {
                        if (display.state === avSession.CastDisplayState.STATE_ON) {
							let castDisplay = display
							if (typeof castDisplay.name === 'string'){
								console.info('castDisplay name type ture')
							} else {
								console.info(`castDisplay name type false`);
							}
                            console.info('castDisplayChange display : ${display.id} ON');
                        } else if (display.state === avSession.CastDisplayState.STATE_OFF) {
                            console.info('castDisplayChange display : ${display.id} OFF');
                        }
                    });
                } catch (err) {
                    expect(err.code).assertEqual(6600101);
                    console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0100 finished");
                }
                done();
            } else {
                console.info(`canIUse('SystemCapability.Multimedia.AVSession.ExtendedDisplayCast') false`);
                done();
            }
        })
		
        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0300
         * @tc.desc   Testing call session castDisplayChange()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            const isExtendedDisplayCast = canIUse('SystemCapability.Multimedia.AVSession.ExtendedDisplayCast');
            if (isExtendedDisplayCast) {
                try {
                    session.on('castDisplayChange', (display) => {
                        if (display.state === avSession.CastDisplayState.STATE_ON) {
							let castDisplay = display
							if (typeof castDisplay.width === 'number'){
								console.info('castDisplay width type ture')
							} else {
								console.info(`castDisplay width type false`);
							}
                            console.info('castDisplayChange display : ${display.id} ON');
                        } else if (display.state === avSession.CastDisplayState.STATE_OFF) {
                            console.info('castDisplayChange display : ${display.id} OFF');
                        }
                    });
                } catch (err) {
                    expect(err.code).assertEqual(6600101);
                    console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0100 finished");
                }
                done();
            } else {
                console.info(`canIUse('SystemCapability.Multimedia.AVSession.ExtendedDisplayCast') false`);
                done();
            }
        })
		
        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0400
         * @tc.desc   Testing call session castDisplayChange()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            const isExtendedDisplayCast = canIUse('SystemCapability.Multimedia.AVSession.ExtendedDisplayCast');
            if (isExtendedDisplayCast) {
                try {
                    session.on('castDisplayChange', (display) => {
                        if (display.state === avSession.CastDisplayState.STATE_ON) {
							let castDisplay = display
							if (typeof castDisplay.height === 'number'){
								console.info('castDisplay height type ture')
							} else {
								console.info(`castDisplay height type false`);
							}
                            console.info('castDisplayChange display : ${display.id} ON');
                        } else if (display.state === avSession.CastDisplayState.STATE_OFF) {
                            console.info('castDisplayChange display : ${display.id} OFF');
                        }
                    });
                } catch (err) {
                    expect(err.code).assertEqual(6600101);
                    console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0100 finished");
                }
                done();
            } else {
                console.info(`canIUse('SystemCapability.Multimedia.AVSession.ExtendedDisplayCast') false`);
                done();
            }
        })
		


	})
}
