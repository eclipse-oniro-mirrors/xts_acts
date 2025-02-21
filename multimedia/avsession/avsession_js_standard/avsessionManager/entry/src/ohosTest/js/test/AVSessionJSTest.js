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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';


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

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0100
         * @tc.name      : dispatchSessionEvent - promise
         * @tc.desc      : Testing call dispatchSessionEvent(promise)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
		it("SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0100", 0, async function (done) {
			session.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS, (err) => {
				if (err) {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0100 error " + JSON.stringify(err));
					expect().assertFail();
					done();
				}
				console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0100 finished");
				expect(true).assertTrue();
				done();
			});
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0200
         * @tc.name      : dispatchSessionEvent - callback
         * @tc.desc      : Testing call dispatchSessionEvent(callback)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
		it("SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0200", 0, async function (done) {
			await session.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0200 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_0200 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0100
         * @tc.name      : setExtras - callback
         * @tc.desc      : Testing call setExtras(callback)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0100", 0, async function (done) {
			session.setExtras(CUSTOM_EXTRAS, (err) => {
				if (err) {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0100 error " + JSON.stringify(err));
					expect().assertFail();
					done();
				}
				console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0100 finished");
				expect(true).assertTrue();
				done();
			});
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0200
         * @tc.name      : setExtras - promise
         * @tc.desc      : Testing call setExtras(promise)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0200", 0, async function (done) {
			await session.setExtras(CUSTOM_EXTRAS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0200 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_0200 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0100
		 * @tc.name      : bind one callback on commonCommand event
		 * @tc.desc      : Testing onCommonCommand callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0100", 0, async function (done) {
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

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0200
		 * @tc.name      : bind two callbacks on commonCommand event
		 * @tc.desc      : Testing onCommonCommand callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0200", 0, async function (done) {
			session.on('commonCommand', commonCommandCallback1);
			session.on('commonCommand', commonCommandCallback2);
			await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0200 Send common command error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (receivedCallback && receivedCallback2) {
				console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0200 Received common command");
				expect(receivedString == COMMON_COMMAND_STRING).assertTrue();
				expect(receivedParam.command == COMMON_COMMAND_PARAMS.command).assertTrue();
				expect(receivedString2 == COMMON_COMMAND_STRING).assertTrue();
				expect(receivedParam2.command == COMMON_COMMAND_PARAMS.command).assertTrue();
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_0200 Common command not received");
				expect().assertFail();
			}
			receivedCallback = false;
			receivedString = null;
			receivedParam = null;
			receivedCallback2 = false;
			receivedString2 = null;
			receivedParam2 = null;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0100
		 * @tc.name      : bind two callbacks on commonCommand event, off one of them 
		 * @tc.desc      : Testing offCommonCommand callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0100", 0, async function (done) {
			session.on('commonCommand', commonCommandCallback1);
			session.on('commonCommand', commonCommandCallback2);
			session.off('commonCommand', commonCommandCallback2);
			await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0100 Send common command error" + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (receivedCallback && !receivedCallback2) {
				console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0100 finished");
				expect(receivedString == COMMON_COMMAND_STRING).assertTrue();
				expect(receivedParam.command == COMMON_COMMAND_PARAMS.command).assertTrue();
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0100 failed");
				expect().assertFail();
			}
			receivedCallback = false;
			receivedString = null;
			receivedParam = null;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0200
		 * @tc.name      : bind two callbacks on commonCommand event, off two of them 
		 * @tc.desc      : Testing offCommonCommand callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0200", 0, async function (done) {
			session.on('commonCommand', commonCommandCallback1);
			session.on('commonCommand', commonCommandCallback2);
			session.off('commonCommand', commonCommandCallback1);
			session.off('commonCommand', commonCommandCallback2);
			await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0200 Send common command error" + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (!receivedCallback && !receivedCallback2) {
				console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0200 finished");
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0200 failed");
				expect().assertFail();
			}
			receivedCallback = false;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0300
		 * @tc.name      : bind two callbacks on commonCommand event, off all of them 
		 * @tc.desc      : Testing offCommonCommand callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0300", 0, async function (done) {
			session.on('commonCommand', commonCommandCallback1);
			session.on('commonCommand', commonCommandCallback2);
			session.off('commonCommand');

			await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0300 Send common command error" + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (!receivedCallback && !receivedCallback2) {
				console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0300 finished");
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_0300 failed");
				expect().assertFail();
			}
			receivedCallback = false;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICESYNC_0100
         * @tc.name      : session getOutputDeviceSync
         * @tc.desc      : Testing call session getOutputDeviceSync(sync)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICESYNC_0100", 0, async function (done) {
			try {
				let outputDeviceInfo = session.getOutputDeviceSync();
				console.log(`Get output device info: ${outputDeviceInfo}`);
				expect(outputDeviceInfo.devices[0].deviceId).assertEqual("0");
			} catch (err) {
				expect().assertFail();
			}
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0100
         * @tc.name      : session castDisplayChange
         * @tc.desc      : Testing call session castDisplayChange(CastDisplayState.STATE_ON|CastDisplayState.STATE_OFF)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it("SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0100", 0, async function (done) {
            try {
                session.on('castDisplayChange', (display) => {
                    if (display.state === avSession.CastDisplayState.STATE_ON) {
                        console.info('castDisplayChange display : ${display.id} ON');
                    } else if (display.state === avSession.CastDisplayState.STATE_OFF){
                        console.info('castDisplayChange display : ${display.id} OFF');
                    }
                });
            } catch (err) {
                expect(err.code).assertEqual(6600101);
                console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_0100 finished");
            }
            done();
        })
	})
}
