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
//import image from '@ohos.multimedia.image';
//import resourceManager from '@ohos.resourceManager';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';


const TAG = "[AVSessionControllerJSTest]";
export default function AVSessionControllerJsTest() {
	describe("AVSessionControllerJsTest", function () {
		let session = null;
		let controller = null;
		let receivedCallback = false;
		let receivedCallback2 = false;
		let receivedString = null;
		let receivedString2 = null;
		let receivedParam = null;
		let receivedParam2 = null;
		let receivedExtras = null;
		let receivedExtras2 = null;
		const INVALID_STRING = "invalid string";
		const UPDATE_LYRICS_EVENT = "dynamic_lyrics";
		const UPDATE_LYRICS_WANT_PARAMS = {
			lyrics: "This is my lyrics"
		};
		const COMMON_COMMAND_STRING = "common_command";
		const COMMON_COMMAND_PARAMS = {
			command: "This is my command"
		};
		const CUSTOM_EXTRAS = {
			extrasKey: "This is custom media packet"
		};
		const QUEUE_ITEM_ID = 666;
		const QUEUE_ITEM_LENGTH = 1;
		const QUEUE_ITEM_KEY_WORD = "QUEUE_ITEM_RELATE";
		const EXTRAS = {
			"items_author": "name"
		};
		const QUEUE_ITEM_DESCRIPTION = {
			mediaId: QUEUE_ITEM_KEY_WORD,
			title: QUEUE_ITEM_KEY_WORD,
			extras: EXTRAS,
			iconUri: "iconUri",
			mediaSize: 10,
			albumTitle: "albumTitle",
			albumCoverUri: "albumCoverUri",
			lyricContent: "lyricContent",
			lyricUri: "lyricUri",
			mediaUri: "mediaUri",
			startPosition: 0,
			creditsPosition: 0,
			appName: "appName",
			displayTags: avSession.DisplayTag.TAG_AUDIO_VIVID,
                        drmScheme: "C83EADEOA7FB9E76B"
		};
		const QUEUE_ITEM_DESCRIPTION_ERROR = {
			mediaId: QUEUE_ITEM_KEY_WORD,
			title: QUEUE_ITEM_KEY_WORD,
			extras: EXTRAS,
			icon: undefined,
			iconUri: "iconUri",
			mediaSize: 10,
			albumTitle: "albumTitle",
			albumCoverUri: "albumCoverUri",
			lyricContent: "lyricContent",
			lyricUri: "lyricUri",
			mediaUri: "mediaUri",
			startPosition: 0,
			creditsPosition: 0,
			appName: "appName",
                        drmScheme: "C83EADEOA7FB9E76S"
		};
		const QUEUE_ITEM = {
			itemId: QUEUE_ITEM_ID,
			description: QUEUE_ITEM_DESCRIPTION
		}
		const QUEUE_ITEM_ERROR = {
			itemId: QUEUE_ITEM_ID,
			description: QUEUE_ITEM_DESCRIPTION_ERROR
		}
		const ITEMS_ARRAY = [QUEUE_ITEM];
		const ITEMS_ARRAY_ERROR = [QUEUE_ITEM_ERROR];
		const QUEUE_TITLE = "title";
		const SKIP_ITEM_ID = 200;



		beforeAll(async function () {
			await initSession()
			await getController();
			console.info(TAG + "Create session and controller finished, beforeAll called");
		})

		afterAll(function () {
			controller.destroy();
			session.destroy();
			console.info(TAG + 'afterAll called');
		})

		beforeEach(function () {
			console.info(TAG + 'beforeEach called');
		})

		afterEach(function () {
			console.info(TAG + 'afterEach called');
		})

		async function initSession() {
			await avSession.createAVSession(featureAbility.getContext(), "AVSessionDemo", 'audio').then(data => {
				session = data;
			}).catch((err) => {
				console.error(TAG + "Create AVSession error " + JSON.stringify(err));
				expect().assertFail();
			});
			session.activate();
		}

		async function getController() {
			await session.getController().then(data => {
				controller = data
			}).catch(err => {
				console.error(TAG + "Get controller error " + JSON.stringify(err));
				expect().assertFail();
			});
		}

		function sleep(time) {
			return new Promise((resolve) => setTimeout(resolve, time));
		}

		function dynamicLyricsCallback1(sessionEvent, args) {
			console.log(TAG + "Callback1 received event: " + JSON.stringify(sessionEvent));
			console.log(TAG + "Callback1 received args: " + JSON.stringify(args));
			if (sessionEvent != UPDATE_LYRICS_EVENT) {
				console.error(TAG + "Callback1 lyrics event unmatch");
				expect().assertFail();
			}
			receivedCallback = true;
			receivedString = sessionEvent;
			receivedParam = args;
		}

		function dynamicLyricsCallback2(sessionEvent, args) {
			console.log(TAG + "Callback2 received event: " + JSON.stringify(sessionEvent));
			console.log(TAG + "Callback2 received args: " + JSON.stringify(args));
			if (sessionEvent != UPDATE_LYRICS_EVENT) {
				console.error(TAG + "Callback2 lyrics event unmatch");
				expect().assertFail();
			}
			receivedCallback2 = true;
			receivedString2 = sessionEvent;
			receivedParam2 = args;
		}

		function extrasChangeCallback1(extras) {
			console.log(TAG + "Callback1 received args: " + JSON.stringify(extras));
			if (extras.extrasKey != CUSTOM_EXTRAS.extrasKey) {
				console.error(TAG + "Callback1 extras unmatch");
				expect().assertFail();
			}
			receivedCallback = true;
			receivedExtras = extras;
		}

		function extrasChangeCallback2(extras) {
			console.log(TAG + "Callback2 received args: " + JSON.stringify(extras));
			if (extras.extrasKey != CUSTOM_EXTRAS.extrasKey) {
				console.error(TAG + "Callback2 extras unmatch");
				expect().assertFail();
			}
			receivedCallback2 = true;
			receivedExtras2 = extras;
		}

		function queueTitleCallback1(title) {
			console.log(TAG + "queueTitleCallback1 received Title " + JSON.stringify(title));
			if (title != QUEUE_TITLE) {
				console.error(TAG + "queueTitleCallback1 received Title unmatch");
				expect().assertFail();
			}
			receivedCallback = true;
		}

		function queueTitleCallback2(title) {
			console.log(TAG + "queueTitleCallback2 received Title " + JSON.stringify(title));
			if (title != QUEUE_TITLE) {
				console.error(TAG + "queueTitleCallback2 received Title unmatch");
				expect().assertFail();
			}
			receivedCallback2 = true;
		}

		function queueItemsCallback1(items) {
			console.log(TAG + "queueItemsCallback1 received items length: " + items.length);
			console.log(TAG + "queueItemsCallback1 received items id: " + items[0].itemId);
			console.log(TAG + "queueItemsCallback1 received items title: " + items[0].description.title);
			if (items.length != QUEUE_ITEM_LENGTH) {
				console.error(TAG + "queueItemsCallback1 received items length unmatch");
				expect().assertFail();
				return;
			}
			if (items[0].itemId != QUEUE_ITEM_ID) {
				console.error(TAG + "queueItemsCallback1 received items id unmatch");
				expect().assertFail();
				return;
			}
			if (items[0].description.title != QUEUE_ITEM_KEY_WORD) {
				console.error(TAG + "queueItemsCallback1 received items key word unmatch");
				expect().assertFail();
				return;
			}
			receivedCallback = true;
		}

		function queueItemsCallback2(items) {
			console.log(TAG + "queueItemsCallback2 received items length: " + items.length);
			console.log(TAG + "queueItemsCallback2 received items id: " + items[0].itemId);
			console.log(TAG + "queueItemsCallback2 received items title: " + items[0].description.title);
			if (items.length != QUEUE_ITEM_LENGTH) {
				console.error(TAG + "queueItemsCallback2 received items length unmatch");
				expect().assertFail();
				return;
			}
			if (items[0].itemId != QUEUE_ITEM_ID) {
				console.error(TAG + "queueItemsCallback2 received items id unmatch");
				expect().assertFail();
				return;
			}
			if (items[0].description.title != QUEUE_ITEM_KEY_WORD) {
				console.error(TAG + "queueItemsCallback2 received items key word unmatch");
				expect().assertFail();
				return;
			}
			receivedCallback2 = true;
		}

		function skipToQueueItemCallback1(itemId) {
			console.log(TAG + "skipToQueueItemCallback1 received itemid " + itemId);
			if (itemId != SKIP_ITEM_ID) {
				console.error(TAG + "skipToQueueItemCallback1 received uid unmatch");
				expect().assertFail();
			}
			receivedCallback = true;
		}

		function skipToQueueItemCallback2(itemId) {
			console.log(TAG + "skipToQueueItemCallback2 received itemid " + itemId);
			if (itemId != SKIP_ITEM_ID) {
				console.error(TAG + "skipToQueueItemCallback2 received uid unmatch");
				expect().assertFail();
			}
			receivedCallback2 = true;
		}

		async function onCallbackInvalidSession(eventName) {
			function callback1() {}
			await session.destroy();
			try {
				session.on(eventName, callback1)
				expect().assertFail();
			} catch (error) {
				expect(error.code).assertEqual(6600102);
			}
			await initSession()
			await getController();
		}

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_0100
         * @tc.name      : bind one callback on sessionEvent event
         * @tc.desc      : Testing on sessionEvent callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_0100", 0, async function (done) {
			controller.on('sessionEvent', dynamicLyricsCallback1);
			await session.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_0100 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			sleep(200).then(() => {
				if (receivedCallback) {
					console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_0100 Received session event change event");
					expect(receivedString == UPDATE_LYRICS_EVENT).assertTrue();
					expect(receivedParam.lyrics == UPDATE_LYRICS_WANT_PARAMS.lyrics).assertTrue();
				} else {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_0100 Session event change event not received");
					expect().assertFail();
				}
				receivedCallback = false;
				receivedString = null;
				receivedParam = null;
				done();
			})
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_0200
         * @tc.name      : bind two callback on sessionEvent event
         * @tc.desc      : Testing on sessionEvent callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_0200", 0, async function (done) {
			controller.on('sessionEvent', dynamicLyricsCallback1);
			controller.on('sessionEvent', dynamicLyricsCallback2);
			await session.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_0200 Set session event error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (receivedCallback && receivedCallback2) {
				console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_0200 Received session event change event");
				expect(receivedString == UPDATE_LYRICS_EVENT).assertTrue();
				expect(receivedParam.lyrics == UPDATE_LYRICS_WANT_PARAMS.lyrics).assertTrue();
				expect(receivedString2 == UPDATE_LYRICS_EVENT).assertTrue();
				expect(receivedParam2.lyrics == UPDATE_LYRICS_WANT_PARAMS.lyrics).assertTrue();
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_0200 Session event change event not received");
				expect().assertFail();
			}
			receivedCallback = false;
			receivedCallback2 = false;
			receivedString2 = null;
			receivedParam2 = null;
			receivedString2 = null;
			receivedParam2 = null;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_0100
		 * @tc.name      : bind two callbacks on sessionEvent event, off one of them 
		 * @tc.desc      : Testing offSessionEvent callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_0100", 0, async function (done) {
			controller.on('sessionEvent', dynamicLyricsCallback1);
			controller.on('sessionEvent', dynamicLyricsCallback2);
			controller.off('sessionEvent', dynamicLyricsCallback2);
			await session.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS).catch((err) => {
				console.error(TAG + "Set session event error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (receivedCallback && !receivedCallback2) {
				console.log(TAG + "Received session event change event");
				expect(receivedString == UPDATE_LYRICS_EVENT).assertTrue();
				expect(receivedParam.lyrics == UPDATE_LYRICS_WANT_PARAMS.lyrics).assertTrue();
				expect(true).assertTrue();
			} else {
				console.error(TAG + "Session event change event not received");
				expect().assertFail();
			}
			receivedCallback = false;
			receivedString = null;
			receivedParam = null;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_0200
		 * @tc.name      : bind two callbacks on sessionEvent event, off two of them 
		 * @tc.desc      : Testing offSessionEvent callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_0200", 0, async function (done) {
			controller.on('sessionEvent', dynamicLyricsCallback1);
			controller.on('sessionEvent', dynamicLyricsCallback2);
			controller.off('sessionEvent', dynamicLyricsCallback1);
			controller.off('sessionEvent', dynamicLyricsCallback2);

			await session.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS).catch((err) => {
				console.error(TAG + "Set session event error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (!receivedCallback && !receivedCallback2) {
				console.log(TAG + "Received session event change event");
				expect(true).assertTrue();
			} else {
				console.error(TAG + "Session event change event not received");
				expect().assertFail();
			}
			receivedCallback = false;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_0300
		 * @tc.name      : bind two callbacks on sessionEvent event, off all of them 
		 * @tc.desc      : Testing offSessionEvent callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_0300", 0, async function (done) {
			controller.on('sessionEvent', dynamicLyricsCallback1);
			controller.on('sessionEvent', dynamicLyricsCallback2);
			controller.off('sessionEvent');

			await session.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS).catch((err) => {
				console.error(TAG + "Set session event error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (!receivedCallback && !receivedCallback2) {
				console.log(TAG + "Received session event change event");
				expect(true).assertTrue();
			} else {
				console.error(TAG + "Session event change event not received");
				expect().assertFail();
			}
			receivedCallback = false;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_0100
         * @tc.name      : controller send common command - callback
         * @tc.desc      : Testing call sendCommonCommand(callback)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_0100", 0, async function (done) {
			controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS, (err) => {
				if (err) {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_0100 error " + JSON.stringify(err));
					expect().assertFail();
					done();
				}
				console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_0100 finished");
				expect(true).assertTrue();
				done();
			});
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_0200
         * @tc.name      : controller send common command - promise
         * @tc.desc      : Testing call sendCommonCommand(promise)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_0200", 0, async function (done) {
			await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_0200 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_0200 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_0100
         * @tc.name      : controller get extras - callback
         * @tc.desc      : Testing call getExtras(callback)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_0100", 0, async function (done) {
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_0100 start");
			await session.setExtras(CUSTOM_EXTRAS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_0100 error " + JSON.stringify(err));
				expect().assertFail();
			});

			controller.getExtras((err, extras) => {
				if (err) {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_0100 error " + JSON.stringify(err));
					expect().assertFail();
					done();
				}
				expect(extras.extrasKey == CUSTOM_EXTRAS.extrasKey).assertTrue();
				console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_0100 finished");
				done();
			});
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_0200
         * @tc.name      : controller get extras - promise
         * @tc.desc      : Testing call getExtras(promise)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_0200", 0, async function (done) {
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_0200 start");
			await session.setExtras(CUSTOM_EXTRAS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_0200 error " + JSON.stringify(err));
				expect().assertFail();
			});

			let extras = await controller.getExtras().catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_0200 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			})
			expect(extras.extrasKey == CUSTOM_EXTRAS.extrasKey).assertTrue();
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_0200 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_0100
         * @tc.name      : bind one callback on extrasChange event
         * @tc.desc      : Testing on extrasChange callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_0100", 0, async function (done) {
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_0100 start");
			controller.on('extrasChange', extrasChangeCallback1);
			await session.setExtras(CUSTOM_EXTRAS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_0100 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			sleep(200).then(() => {
				if (receivedCallback) {
					console.log(TAG + "Received extras change event");
					expect(receivedExtras.extrasKey == CUSTOM_EXTRAS.extrasKey).assertTrue();
				} else {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_0100 extras change event not received");
					expect().assertFail();
				}
				receivedCallback = false;
				receivedExtras = null;
				console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_0100 finished");
				done();
			})
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_0200
         * @tc.name      : bind two callback on extrasChange event
         * @tc.desc      : Testing on extrasChange callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_0200", 0, async function (done) {
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_0200 start");
			controller.on('extrasChange', extrasChangeCallback1);
			controller.on('extrasChange', extrasChangeCallback2);
			await session.setExtras(CUSTOM_EXTRAS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_0200 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			sleep(200).then(() => {
				if (receivedCallback && receivedCallback2) {
					console.log(TAG + "Received extras change event");
					expect(receivedExtras.extrasKey == CUSTOM_EXTRAS.extrasKey).assertTrue();
					expect(receivedExtras2.extrasKey == CUSTOM_EXTRAS.extrasKey).assertTrue();
				} else {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_0200 extras change event not received");
					expect().assertFail();
				}
				receivedCallback = false;
				receivedCallback2 = false;
				receivedExtras = null;
				receivedExtras2 = null;
				console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_0200 finished");
				done();
			})
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0100
		 * @tc.name      : bind two callbacks on extrasChange event, off one of them 
		 * @tc.desc      : Testing offExtrasChange callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0100", 0, async function (done) {
			controller.on('extrasChange', extrasChangeCallback1);
			controller.on('extrasChange', extrasChangeCallback2);
			controller.off('extrasChange', extrasChangeCallback2);
			await session.setExtras(CUSTOM_EXTRAS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0100 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (receivedCallback && !receivedCallback2) {
				console.log(TAG + "Received extras change event");
				expect(receivedExtras.extrasKey == CUSTOM_EXTRAS.extrasKey).assertTrue();
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0100 Extras change event not received");
				expect().assertFail();
			}
			receivedCallback = false;
			receivedExtras = null;
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0100 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0200
		 * @tc.name      : bind two callbacks on extrasChange event, off two of them 
		 * @tc.desc      : Testing offExtrasChange callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0200", 0, async function (done) {
			controller.on('extrasChange', extrasChangeCallback1);
			controller.on('extrasChange', extrasChangeCallback2);
			controller.off('extrasChange', extrasChangeCallback1);
			controller.off('extrasChange', extrasChangeCallback2);
			await session.setExtras(CUSTOM_EXTRAS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0200 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (!receivedCallback && !receivedCallback2) {
				console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0200 Success, not received extras change event");
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0200 failed, extras change event received");
				expect().assertFail();
			}
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0200 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0300
		 * @tc.name      : bind two callbacks on extrasChange event, off all of them 
		 * @tc.desc      : Testing offExtrasChange callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0300", 0, async function (done) {
			controller.on('extrasChange', extrasChangeCallback1);
			controller.on('extrasChange', extrasChangeCallback2);
			controller.off('extrasChange');
			await session.setExtras(CUSTOM_EXTRAS).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0300 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (!receivedCallback && !receivedCallback2) {
				console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0300Success, not received extras change event");
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0300 failed, extras change event received");
				expect().assertFail();
			}
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_0300 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_0100
         * @tc.name      : bind one callback on queueItemsChange event
         * @tc.desc      : Testing on queueItemsChange callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_0100", 0, async function (done) {
			controller.on('queueItemsChange', queueItemsCallback1);
			await session.setAVQueueItems(ITEMS_ARRAY).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_0100 setAVQueueItems error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			sleep(200).then(() => {
				if (receivedCallback) {
					console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_0100 Received queue items change");
					expect(true).assertTrue();
				} else {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_0100 Session queue items change  not received");
					expect().assertFail();
				}
				receivedCallback = false;
				done();
			});
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_0200
         * @tc.name      : bind two callback on queueItemsChange event
         * @tc.desc      : Testing on queueItemsChange callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_0200", 0, async function (done) {
			controller.on('queueItemsChange', queueItemsCallback1);
			controller.on('queueItemsChange', queueItemsCallback2);
			await session.setAVQueueItems(ITEMS_ARRAY).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_0200 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (receivedCallback && receivedCallback2) {
				console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_0200 Received queue items change");
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_0200 Session queue items change  not received");
				expect().assertFail();
			}
			receivedCallback = false;
			receivedCallback2 = false;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_0100
         * @tc.name      : bind one callback on queueTitleChange event
         * @tc.desc      : Testing on queueTitleChange callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_0100", 0, async function (done) {
			controller.on('queueTitleChange', queueTitleCallback1);
			await session.setAVQueueTitle(QUEUE_TITLE).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_0100 setAVQueueTitle error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			sleep(200).then(() => {
				if (receivedCallback) {
					console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_0100 Received queue Title change");
					expect(true).assertTrue();
				} else {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_0100 Session queue Title change  not received");
					expect().assertFail();
				}
				receivedCallback = false;
				done();
			});
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_0100
         * @tc.name      : bind two callback on queueTitleChange event
         * @tc.desc      : Testing on queueTitleChange callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_0200", 0, async function (done) {
			controller.on('queueTitleChange', queueTitleCallback1);
			controller.on('queueTitleChange', queueTitleCallback2);
			await session.setAVQueueTitle(QUEUE_TITLE).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_0200 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (receivedCallback && receivedCallback2) {
				console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_0200 Received queue Title change");
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_0200 Session queue Title change  not received");
				expect().assertFail();
			}
			receivedCallback = false;
			receivedCallback2 = false;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_0100
		 * @tc.name      : bind two callbacks on queueItemsChange event, off one of them 
		 * @tc.desc      : Testing offQueueItemsChange callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_0100", 0, async function (done) {
			controller.on('queueItemsChange', queueItemsCallback1);
			controller.on('queueItemsChange', queueItemsCallback2);
			controller.off('queueItemsChange', queueItemsCallback2);
			await session.setAVQueueItems(ITEMS_ARRAY).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_0100 setAVQueueItems error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (receivedCallback && !receivedCallback2) {
				console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_0100 Received queue items change");
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_0100 Session queue items change  not received");
				expect().assertFail();
			}
			receivedCallback = false;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_0200
		 * @tc.name      : bind two callbacks on queueItemsChange event, off two of them 
		 * @tc.desc      : Testing offQueueItemsChange callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_0200", 0, async function (done) {
			controller.on('queueItemsChange', queueItemsCallback1);
			controller.on('queueItemsChange', queueItemsCallback2);
			controller.off('queueItemsChange', queueItemsCallback1);
			controller.off('queueItemsChange', queueItemsCallback2);
			await session.setAVQueueItems(ITEMS_ARRAY).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_0200 setAVQueueItems error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (!receivedCallback && !receivedCallback2) {
				console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_0200 Received queue items change");
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_0200 Session queue items change  not received");
				expect().assertFail();
			}
			receivedCallback = false;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_0300
		 * @tc.name      : bind two callbacks on queueItemsChange event, off all of them 
		 * @tc.desc      : Testing offQueueItemsChange callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_0300", 0, async function (done) {
			controller.on('queueItemsChange', queueItemsCallback1);
			controller.on('queueItemsChange', queueItemsCallback2);
			controller.off('queueItemsChange');
			await session.setAVQueueItems(ITEMS_ARRAY).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_0300 setAVQueueItems error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (!receivedCallback && !receivedCallback2) {
				console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_0300 Received queue items change");
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_0300 Session queue items change  not received");
				expect().assertFail();
			}
			receivedCallback = false;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_0100
		 * @tc.name      : bind two callbacks on queueTitleChange event, off one of them 
		 * @tc.desc      : Testing offQueueTitleChange callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_0100", 0, async function (done) {
			controller.on('queueTitleChange', queueTitleCallback1);
			controller.on('queueTitleChange', queueTitleCallback2);
			controller.off('queueTitleChange', queueTitleCallback2);
			await session.setAVQueueTitle(QUEUE_TITLE).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_0100 setAVQueueTitle error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (receivedCallback && !receivedCallback2) {
				console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_0100 Received queue Title change");
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_0100 Session queue Title change  not received");
				expect().assertFail();
			}
			receivedCallback = false;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_0200
		 * @tc.name      : bind two callbacks on queueTitleChange event, off two of them 
		 * @tc.desc      : Testing offQueueTitleChange callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_0200", 0, async function (done) {
			controller.on('queueTitleChange', queueTitleCallback1);
			controller.on('queueTitleChange', queueTitleCallback2);
			controller.off('queueTitleChange', queueTitleCallback1);
			controller.off('queueTitleChange', queueTitleCallback2);

			await session.setAVQueueTitle(QUEUE_TITLE).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_0200 setAVQueueTitle error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (!receivedCallback && !receivedCallback2) {
				console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_0200 Received queue Title change");
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_0200 Session queue Title change  not received");
				expect().assertFail();
			}
			receivedCallback = false;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_0300
		 * @tc.name      : bind two callbacks on queueTitleChange event, off all of them 
		 * @tc.desc      : Testing offQueueTitleChange callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
		 */
		it("SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_0300", 0, async function (done) {
			controller.on('queueTitleChange', queueTitleCallback1);
			controller.on('queueTitleChange', queueTitleCallback2);
			controller.off('queueTitleChange');

			await session.setAVQueueTitle(QUEUE_TITLE).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_0300 setAVQueueTitle error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (!receivedCallback && !receivedCallback2) {
				console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_0300 Received queue Title change");
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_0300 Session queue Title change  not received");
				expect().assertFail();
			}
			receivedCallback = false;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_0100
         * @tc.name      : session set Items of AVQueue - callback
         * @tc.desc      : Testing call setAVQueueItems(callback)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_0100", 0, async function (done) {
			session.setAVQueueItems(ITEMS_ARRAY, (err) => {
				if (err) {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_0100 error " + JSON.stringify(err));
					expect().assertFail();
					done();
				}
				console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_0100 finished");
				expect(true).assertTrue();
				done();
			});
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_0200
         * @tc.name      : session set Items of AVQueue - promise
         * @tc.desc      : Testing call setAVQueueItems(promise)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_0200", 0, async function (done) {
			await session.setAVQueueItems(ITEMS_ARRAY).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_0200 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_0200 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_0100
         * @tc.name      : session set title of AVQueue - callback
         * @tc.desc      : Testing call setAVQueueTitle(callback)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_0100", 0, async function (done) {
			session.setAVQueueTitle(QUEUE_TITLE, (err) => {
				if (err) {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_0100 error " + JSON.stringify(err));
					expect().assertFail();
					done();
				}
				console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_0100 finished");
				expect(true).assertTrue();
				done();
			});
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_0200
         * @tc.name      : session set title of AVQueue - promise
         * @tc.desc      : Testing call setAVQueueTitle(promise)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_0200", 0, async function (done) {
			await session.setAVQueueTitle(QUEUE_TITLE).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_0200 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUETITLE_0200 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_0100
         * @tc.name      : controller skip to QueueItem by queue item id - callback
         * @tc.desc      : Testing call skipToQueueItem(callback)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_0100", 0, async function (done) {
			controller.skipToQueueItem(QUEUE_ITEM_ID, (err) => {
				if (err) {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_0100 error " + JSON.stringify(err));
					expect().assertFail();
					done();
				}
				console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_0100 finished");
				expect(true).assertTrue();
				done();
			});
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_0200
         * @tc.name      : controller skip to QueueItem by queue item id - promise
         * @tc.desc      : Testing call skipToQueueItem(promise)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_0200", 0, async function (done) {
			await controller.skipToQueueItem(QUEUE_ITEM_ID).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_0200 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_0200 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_0100
         * @tc.name      : bind one callback on skipToQueueItem event
         * @tc.desc      : Testing on skipToQueueItem callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_0100", 0, async function (done) {
			session.on('skipToQueueItem', skipToQueueItemCallback1);
			await controller.skipToQueueItem(SKIP_ITEM_ID).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_0100 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			sleep(200).then(() => {
				if (receivedCallback) {
					console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_0100 Received skipToQueueItem ");
					expect(true).assertTrue();
				} else {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_0100 skipToQueueItem not received");
					expect().assertFail();
				}
				receivedCallback = false;
				done();
			})
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_0200
         * @tc.name      : bind two callback on skipToQueueItem event
         * @tc.desc      : Testing on skipToQueueItem callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_0200", 0, async function (done) {
			session.on('skipToQueueItem', skipToQueueItemCallback1);
			session.on('skipToQueueItem', skipToQueueItemCallback2);
			await controller.skipToQueueItem(SKIP_ITEM_ID).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_0200 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
			await sleep(200);
			if (receivedCallback && receivedCallback2) {
				console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_0200 Received skipToQueueItem ");
				expect(true).assertTrue();
			} else {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONSKIPTOQUEUEITEM_0200skipToQueueItem not received");
				expect().assertFail();
			}
			receivedCallback = false;
			receivedCallback2 = false;
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0100
         * @tc.name      : controller get items of AVQueue - callback
         * @tc.desc      : Testing call getAVQueueItems(callback)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0100", 0, async function (done) {
			session.setAVQueueItems(ITEMS_ARRAY, (err) => {
				if (err) {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0100 error " + JSON.stringify(err));
					expect().assertFail();
					done();
				} else {
					controller.getAVQueueItems((err) => {
						if (err) {
							console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0100 error " + JSON.stringify(err));
							expect().assertFail();
						} else {
							console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0100 finished");
							expect(true).assertTrue();
						}
						done();
					});
				}
			});
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0200
         * @tc.name      : controller get items of AVQueue - promise
         * @tc.desc      : Testing call getAVQueueItems(promise)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0200", 0, async function (done) {
			await session.setAVQueueItems(ITEMS_ARRAY).then(async () => {
				await controller.getAVQueueItems().catch((err) => {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0200 error " + JSON.stringify(err));
					expect().assertFail();
				});
				done();
			}).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SETAVQUEUEITEMS_0200 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_0100
         * @tc.name      : controller get title of AVQueue - callback
         * @tc.desc      : Testing call getAVQueueTitle(callback)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_0100", 0, async function (done) {
			session.setAVQueueTitle(QUEUE_TITLE, (err) => {
				if (err) {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_0100 error " + JSON.stringify(err));
					expect().assertFail();
					done();
				} else {
					controller.getAVQueueTitle((err) => {
						if (err) {
							console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_0100 error " + JSON.stringify(err));
							expect().assertFail();
						} else {
							console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_0100 finished");
							expect(true).assertTrue();
						}
						done();
					});
				}
			});
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_0200
         * @tc.name      : controller get title of AVQueue - promise
         * @tc.desc      : Testing call getAVQueueTitle(promise)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_0200", 0, async function (done) {
			await session.setAVQueueTitle(QUEUE_TITLE).then(async () => {
				await controller.getAVQueueTitle().catch((err) => {
					console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_0200 error " + JSON.stringify(err));
					expect().assertFail();
				});
				done();
			}).catch((err) => {
				console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_0200 error " + JSON.stringify(err));
				expect().assertFail();
				done();
			});
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_0100
         * @tc.name      : controller get Playback State - async
         * @tc.desc      : Testing call getAVPlaybackStateSync
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_0100", 0, async function (done) {
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_0100 start");
			try {
				let playbackState = {
					state: 0
				}
				await session.setAVPlaybackState(playbackState);
				sleep(200);
				let currentPlaybackState = controller.getAVPlaybackStateSync();
				console.log(`Get playback state: ${playbackState}`);
				expect(currentPlaybackState.state).assertEqual(0);
			} catch (err) {
				expect().assertFail();
			}
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_0100 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_0100
         * @tc.name      : controller get metadata - async
         * @tc.desc      : Testing call getAVMetadataSync
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_0100", 0, async function (done) {
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_0100 start");
			try {
				let metaData = {
					assetId: "0"
				}
				await session.setAVMetadata(metaData);
				sleep(200);
				let currentMetaData = controller.getAVMetadataSync();
				console.log(`Get metadata: ${currentMetaData}`);
				expect(currentMetaData.assetId).assertEqual("0");
			} catch (err) {
				expect().assertFail();
			}
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_0100 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_0100
         * @tc.name      : controller get title of avqueue - async
         * @tc.desc      : Testing call getAVQueueTitleSync
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_0100", 0, async function (done) {
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_0100 start");
			try {
				await session.setAVQueueTitle(QUEUE_TITLE);
				sleep(200);
				let currentQueueTitle = controller.getAVQueueTitleSync();
				console.log(`Get queue title: ${currentQueueTitle}`);
				expect(currentQueueTitle).assertEqual(QUEUE_TITLE);
			} catch (err) {
				expect().assertFail();
			}
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_0100 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_0100
         * @tc.name      : controller get items of avqueue - async
         * @tc.desc      : Testing call getAVQueueItemsSync
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_0100", 0, async function (done) {
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_0100 start");
			try {
				await session.setAVQueueItems(ITEMS_ARRAY);
				sleep(200);
				let currentQueueItem = controller.getAVQueueItemsSync();
				console.log(`Get queue item: ${currentQueueItem}`);
				expect(currentQueueItem[0].itemId).assertEqual(ITEMS_ARRAY[0].itemId);
			} catch (err) {
				expect().assertFail();
			}
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_0100 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CONTROLLER_GETOUTPUTDEVICESYNC_0100
         * @tc.name      : controller get output devices info - async
         * @tc.desc      : Testing call getOutputDeviceSync
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_CONTROLLER_GETOUTPUTDEVICESYNC_0100", 0, async function (done) {
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_CONTROLLER_GETOUTPUTDEVICESYNC_0100 start");
			try {
				let outputDeviceInfo = controller.getOutputDeviceSync();
				console.log(`Get output device info: ${outputDeviceInfo}`);
				expect(outputDeviceInfo.devices[0].deviceId).assertEqual("0");
			} catch (err) {
				expect().assertFail();
			}
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_CONTROLLER_GETOUTPUTDEVICESYNC_0100 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_0100
         * @tc.name      : controller get session isActive - async
         * @tc.desc      : Testing call isActiveSync
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_0100", 0, async function (done) {
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_0100 start");
			try {
				await session.activate();
				sleep(200);
				let isActive = controller.isActiveSync();
				console.log(`Get session active state: ${isActive}`);
				expect(isActive).assertEqual(true);
			} catch (err) {
				expect().assertFail();
			}
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_0100 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_0100
         * @tc.name      : controller get session support command - async
         * @tc.desc      : Testing call getValidCommandsSync
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_0100", 0, async function (done) {
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_0100 start");
			try {
				session.on('play', () => { });
				sleep(200);
				let validCommands = controller.getValidCommandsSync();
				console.log(`Get valid commands: ${validCommands}`);
				expect(validCommands[0]).assertEqual('play');
			} catch (err) {
				expect().assertFail();
			}
			console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_0100 finished");
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0300
         * @tc.name      : controller get items of AVQueue - promise
         * @tc.desc      : Testing call getAVQueueItems(drmScheme)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0300", 2, async function (done) {
            await session.setAVQueueItems(ITEMS_ARRAY).then(async () => {
                await controller.getAVQueueItems().then((items) => {
                    console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0300 data " + JSON.stringify(items));
                    if (items[0].description.drmScheme === ITEMS_ARRAY[0].description.drmScheme){
                        expect(true).assertTrue();
                    }else{
                        expect().assertFail();
                        done();
                    }
                    done();
                });
            }).catch((err) => {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0300 error " + JSON.stringify(err));
                expect().assertFail();
                done();
            });
        })
    })
}
