/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import hiSysEvent from '@ohos.hiSysEvent'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

export default function hiSysEventJsTest() {
describe('hiSysEventJsTest', function () {
    beforeAll(function() {
        console.info('hiSysEventJsTest beforeAll called')
    })

    afterAll(function() {
        console.info('hiSysEventJsTest afterAll called')
    })

    beforeEach(function() {
        console.info('hiSysEventJsTest beforeEach called')
    })

    afterEach(function() {
        console.info('hiSysEventJsTest afterEach called')
    })

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_0100
	 * @tc.name testHiSysEventApi01
	 * @tc.desc 添加Js打点事件-callback方式进行回调处理
	 */
	it('testHiSysEventApi01', 1, async function (done) {
		console.info('testHiSysEventApi01 start')
		hiSysEvent.write({
			domain: "RELIABILITY",
			name: "STACK",
			eventType: hiSysEvent.EventType.FAULT,
		},(err, value) => {
			console.log('HiSysEvent into json-callback');
			if (err) {
				console.error(`HiSysEvent json-callback-error code=${err.code}`);
				expect(err.code == 0).assertFail();
				done();
			} else {
				console.log(`HiSysEvent json-callback-success value=${value}`);
				expect(value == 0).assertTrue();
				done();
			}
		});
		console.info('testHiSysEventApi01 end')
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_0200
	 * @tc.name testHiSysEventApi02
	 * @tc.desc 添加Js打点事件-Promise方式中then()方法进行打点成功回调处理
	 */
	it('testHiSysEventApi02', 1, async function (done) {
		console.info('testHiSysEventApi02 start')
		hiSysEvent.write({
			domain: "RELIABILITY",
			name: "STACK",
			eventType: hiSysEvent.EventType.FAULT,
		}).then(
			(value) => {
				console.log(`HiSysEvent json-callback-success value=${value}`);
				expect(value == 0).assertTrue();
				done();
			}
		).catch(
			(err) => {
				console.error(`HiSysEvent json-callback-error code=${err.code}`);
				expect(err.code == 0).assertFail();
			}
		)
		console.info('testHiSysEventApi02 end')
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_0300
	 * @tc.name testHiSysEventApi03
	 * @tc.desc 验证调用HiSysEvent write接口，打点fault类型事件，支持基础数据类型自定义传参
	 */
	it('testHiSysEventApi03', 1, async function (done) {
		console.info('testHiSysEventApi03 start')
		try {
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT,
				params: {
					MAX: Number.MAX_VALUE,
					MIN: Number.MIN_VALUE,
					INT: 100,
					DOU: 30949.374,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "syseventservice_HiSysEventApi03",
					BOOL: true,
					UNF: undefined,
					NUL: null,
					MSG: [123, 3.14, 0.123]
				}
			},(err, value) => {
				if (err) {
					console.error(`testHiSysEventApi03 json-callback-error code=${err.code}`);
					expect().assertFail();
					done();
				} else {
					console.log(`testHiSysEventApi03 json-callback-success value=${value}`);
					expect(value == 0).assertTrue();
					console.info('testHiSysEventApi03 end')
					done();
				}
			})
		} catch (error) {
			console.error(`testHiSysEventApi03 error code: ${error.code}, error msg: ${error.message}`);
			expect(false).assertTrue()
			console.info('testHiSysEventApi03 error')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_0400
	 * @tc.name testHiSysEventApi04
	 * @tc.desc 验证调用HiSysEvent write接口，打点statistic类型事件，支持基础数据类型自定义传参
	 */
	it('testHiSysEventApi04', 3, async function (done) {
		console.info('testHiSysEventApi04 start')
		try {
			hiSysEvent.write({
				domain: "HIVIEWDFX",
				name: "PLUGIN_STATS",
				eventType: hiSysEvent.EventType.STATISTIC,
				params: {
					MAX: Number.MAX_VALUE,
					MIN: Number.MIN_VALUE,
					INT: 100,
					DOU: 30949.374,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "syseventservice_HiSysEventApi04",
					BOOL: true,
					UNF: undefined,
					NUL: null,
					MSG: [123, 3.14, 0.123]
				}
			},(err, value) => {
				if (err) {
					console.error(`testHiSysEventApi04 json-callback-error code=${err.code}`);
					expect().assertFail();
					done();
				} else {
					console.log(`testHiSysEventApi04 json-callback-success value=${value}`);
					expect(value == 0).assertTrue();
					console.info('testHiSysEventApi04 end')
					done();
				}
			})
		} catch (error) {
			console.error(`testHiSysEventApi04 error code: ${error.code}, error msg: ${error.message}`);
			expect(false).assertTrue()
			console.info('testHiSysEventApi04 error')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_0500
	 * @tc.name testHiSysEventApi05
	 * @tc.desc 验证调用HiSysEvent write接口，打点security类型事件，支持基础数据类型自定义传参
	 */
	it('testHiSysEventApi05', 3, async function (done) {
		console.info('testHiSysEventApi05 start')
		try {
			hiSysEvent.write({
				domain: "ACCOUNT",
				name: "PERMISSION_EXCEPTION",
				eventType: hiSysEvent.EventType.SECURITY,
				params: {
					MAX: Number.MAX_VALUE,
					MIN: Number.MIN_VALUE,
					INT: 100,
					DOU: 30949.374,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "syseventservice_HiSysEventApi05",
					BOOL: true,
					UNF: undefined,
					NUL: null,
					MSG: [123, 3.14, 0.123]
				}
			},(err, value) => {
				if (err) {
					console.error(`testHiSysEventApi05 json-callback-error code=${err.code}`);
					expect().assertFail();
					done();
				} else {
					console.log(`testHiSysEventApi05 json-callback-success value=${value}`);
					expect(value == 0).assertTrue();
					console.info('testHiSysEventApi05 end')
					done();
				}
			})
		} catch (error) {
			console.error(`testHiSysEventApi05 error code: ${error.code}, error msg: ${error.message}`);
			expect(false).assertTrue()
			console.info('testHiSysEventApi05 error')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_0600
	 * @tc.name testHiSysEventApi06
	 * @tc.desc 验证调用HiSysEvent write接口，打点behavior类型事件，支持基础数据类型自定义传参
	 */
	it('testHiSysEventApi06', 3, async function (done) {
		console.info('testHiSysEventApi06 start')
		try {
			hiSysEvent.write({
				domain: "HIVIEWDFX",
				name: "PLUGIN_LOAD",
				eventType: hiSysEvent.EventType.BEHAVIOR,
				params: {
					MAX: Number.MAX_VALUE,
					MIN: Number.MIN_VALUE,
					INT: 100,
					DOU: 30949.374,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "syseventservice_HiSysEventApi06",
					BOOL: true,
					UNF: undefined,
					NUL: null,
					MSG: [123, 3.14, 0.123]
				}
			},(err, value) => {
				if (err) {
					console.error(`testHiSysEventApi06 json-callback-error code=${err.code}`);
					expect().assertFail();
					done();
				} else {
					console.log(`testHiSysEventApi06 json-callback-success value=${value}`);
					expect(value == 0).assertTrue();
					console.info('testHiSysEventApi06 end')
					done();
				}
			})
		} catch (error) {
			console.error(`testHiSysEventApi06 error code: ${error.code}, error msg: ${error.message}`);
			expect(false).assertTrue()
			console.info('testHiSysEventApi06 error')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_0700
	 * @tc.name testHiSysEventApi07
	 * @tc.desc 验证调用HiSysEvent write接口，支持自定义传参最大字符串10k
	 */
	it('testHiSysEventApi07', 3, async function (done) {
		console.info('testHiSysEventApi07 start')
		try {
			hiSysEvent.write({
				domain: "HIVIEWDFX",
				name: "PLUGIN_LOAD",
				eventType: hiSysEvent.EventType.BEHAVIOR,
				params: {
					PROCESS_NAME: Array.from({length: 10 * 1024 + 1}).join("a"),
				}
			},(err, value) => {
				if (err) {
					console.error(`testHiSysEventApi07 json-callback-error code=${err.code}`);
					expect().assertFail();
					done();
				} else {
					console.log(`testHiSysEventApi07 json-callback-success value=${value}`);
					expect(value == 0).assertTrue();
					console.info('testHiSysEventApi07 end')
					done();
				}
			})
		} catch (error) {
			console.error(`testHiSysEventApi07 error code: ${error.code}, error msg: ${error.message}`);
			expect(false).assertTrue()
			console.info('testHiSysEventApi07 error')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_0800
	 * @tc.name testHiSysEventApi08
	 * @tc.desc 验证调用HiSysEvent write接口，支持自定义传参最多参数个数128个
	 */
	it('testHiSysEventApi08', 3, async function (done) {
		console.info('testHiSysEventApi08 start')
		let largeParams = {}
		for (let i = 0; i < 128; i++) {
			largeParams["name" + i] = i
		}
		try {
			hiSysEvent.write({
				domain: "HIVIEWDFX",
				name: "PLUGIN_LOAD",
				eventType: hiSysEvent.EventType.BEHAVIOR,
				params: largeParams
			},(err, value) => {
				if (err) {
					console.error(`testHiSysEventApi08 json-callback-error code=${err.code}`);
					expect().assertFail();
					done();
				} else {
					console.log(`testHiSysEventApi08 json-callback-success value=${value}`);
					expect(value == 0).assertTrue();
					console.info('testHiSysEventApi08 end')
					done();
				}
			})
		} catch (error) {
			console.error(`testHiSysEventApi08 error code: ${error.code}, error msg: ${error.message}`);
			expect(false).assertTrue()
			console.info('testHiSysEventApi08 error')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_0900
	 * @tc.name testHiSysEventApi09
	 * @tc.desc 验证调用HiSysEvent write接口，支持自定义传参最长数组个数100个
	 */
	it('testHiSysEventApi09', 3, async function (done) {
		console.info('testHiSysEventApi09 start')
		let msgArray = []
		for (let i = 0; i < 100; i++) {
			msgArray[i] = i
		}
		try {
			hiSysEvent.write({
				domain: "HIVIEWDFX",
				name: "PLUGIN_LOAD",
				eventType: hiSysEvent.EventType.BEHAVIOR,
				params: {
					MSG: msgArray
				}
			},(err, value) => {
				if (err) {
					console.error(`testHiSysEventApi09 json-callback-error code=${err.code}`);
					expect().assertFail();
					done();
				} else {
					console.log(`testHiSysEventApi09 json-callback-success value=${value}`);
					expect(value == 0).assertTrue();
					console.info('testHiSysEventApi09 end')
					done();
				}
			})
		} catch (error) {
			console.error(`testHiSysEventApi09 error code: ${error.code}, error msg: ${error.message}`);
			expect(false).assertTrue()
			console.info('testHiSysEventApi09 error')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1000
	 * @tc.name testHiSysEventApi10
	 * @tc.desc 验证可成功调用addwatcher接口，订阅规则domain+eventName+tag, rule=PREFIX
	 */
	it('testHiSysEventApi10', 3, async function (done) {
		console.info('testHiSysEventApi10 start')
		let watcher110
		watcher110 = {
			rules: [{
				domain: "RELIABILI",
				name: "STA",
				tag: "STABILI",
				ruleType: hiSysEvent.RuleType.PREFIX
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi10: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi10: domain is ${info.domain}, name is ${info.name},
            		eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi10: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi10 Onservice died`);
			}
		}
		try {
			hiSysEvent.addWatcher(watcher110)
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT
			},(err, value) => {
				if (err) {
					console.error(`testHiSysEventApi10 json-callback-error code=${err.code}`);
					done();
				} else {
					console.log(`testHiSysEventApi10 json-callback-success value=${value}`);
				}
			});
			console.info('testHiSysEventApi10 end')
		} catch (err) {
			console.error(`testHiSysEventApi10 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi10 end')
			done()
		}
		setTimeout(() => {
			hiSysEvent.removeWatcher(watcher110)
			done()
		}, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1100
	 * @tc.name testHiSysEventApi11
	 * @tc.desc 验证可成功调用addwatcher接口，订阅规则domain+eventName+tag, rule=REGULAR
	 */
	it('testHiSysEventApi11', 3, async function (done) {
		console.info('testHiSysEventApi11 start')
		let watcher111
		watcher111 = {
			rules: [{
				domain: "RELIABILI\\w+",
				name: "STA\\w+",
				tag: "STABILI\\w+",
				ruleType: hiSysEvent.RuleType.REGULAR
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi11: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi11: domain is ${info.domain}, name is ${info.name},
            		eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi11: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi11 Onservice died`);
			}
		}
		try {
			hiSysEvent.addWatcher(watcher111)
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT
			},(err, value) => {
				if (err) {
					console.error(`testHiSysEventApi11 json-callback-error code=${err.code}`);
					done()
				} else {
					console.log(`testHiSysEventApi11 json-callback-success value=${value}`);
				}
			});
			console.info('testHiSysEventApi11 end')
		} catch (err) {
			console.error(`testHiSysEventApi11 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi11 end')
			done()
		}
		setTimeout(() => {
			hiSysEvent.removeWatcher(watcher111)
			done()
		}, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1200
	 * @tc.name testHiSysEventApi12
	 * @tc.desc 验证可成功调用addwatcher接口，订阅规则domain+eventName+tag, rule=WHOLE_WORD
	 */
	it('testHiSysEventApi12', 3, async function (done) {
		console.info('testHiSysEventApi12 start')
		let watcher112
		watcher112 = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				tag: "STABILITY",
				ruleType: hiSysEvent.RuleType.WHOLE_WORD
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi12: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi12: domain is ${info.domain}, name is ${info.name},
            		eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi12: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi12 Onservice died`);
			}
		}
		try {
			hiSysEvent.addWatcher(watcher112)
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT
			},(err, value) => {
				if (err) {
					console.error(`testHiSysEventApi12 json-callback-error code=${err.code}`);
					done();
				} else {
					console.log(`testHiSysEventApi12 json-callback-success value=${value}`);
				}
			});
			console.info('testHiSysEventApi12 end')
		} catch (err) {
			console.error(`testHiSysEventApi12 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi12 end')
			done()
		}
		setTimeout(() => {
			hiSysEvent.removeWatcher(watcher112)
			done()
		}, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1300
	 * @tc.name testHiSysEventApi13
	 * @tc.desc 验证可成功调用addwatcher接口，订阅规则domain+eventNameg, rule=PREFIX
	 */
	it('testHiSysEventApi13', 3, async function (done) {
		console.info('testHiSysEventApi13 start')
		let watcher113
		watcher113 = {
			rules: [{
				domain: "RELIABILI",
				name: "STA",
				ruleType: hiSysEvent.RuleType.PREFIX
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi13: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi13: domain is ${info.domain}, name is ${info.name},
            		eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi13: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi13 Onservice died`);
			}
		}
		try {
			hiSysEvent.addWatcher(watcher113)
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT
			},(err, value) => {
				if (err) {
					console.error(`testHiSysEventApi13 json-callback-error code=${err.code}`);
					done();
				} else {
					console.log(`testHiSysEventApi13 json-callback-success value=${value}`);
				}
			});
			console.info('testHiSysEventApi13 end')
		} catch (err) {
			console.error(`testHiSysEventApi13 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi13 end')
			done()
		}
		setTimeout(() => {
			hiSysEvent.removeWatcher(watcher113)
			done()
		}, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1400
	 * @tc.name testHiSysEventApi14
	 * @tc.desc 验证可成功调用addwatcher接口，订阅规则domain+eventName, rule=REGULAR
	 */
	it('testHiSysEventApi14', 3, async function (done) {
		console.info('testHiSysEventApi14 start')
		let watcher114
		watcher114 = {
			rules: [{
				domain: "RELIABILI\\w+",
				name: "STA\\w+",
				ruleType: hiSysEvent.RuleType.REGULAR
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi14: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi14: domain is ${info.domain}, name is ${info.name},
            		eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi14: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi14 Onservice died`);
			}
		}
		try {
			hiSysEvent.addWatcher(watcher114)
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT
			},(err, value) => {
				if (err) {
					console.error(`testHiSysEventApi14 json-callback-error code=${err.code}`);
					done()
				} else {
					console.log(`testHiSysEventApi14 json-callback-success value=${value}`);
				}
			});
			console.info('testHiSysEventApi14 end')
		} catch (err) {
			console.error(`testHiSysEventApi14 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi14 end')
			done()
		}
		setTimeout(() => {
			hiSysEvent.removeWatcher(watcher114)
			done()
		}, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1500
	 * @tc.name testHiSysEventApi15
	 * @tc.desc 验证可成功调用addwatcher接口，订阅规则domain+eventName, rule=WHOLE_WORD
	 */
	it('testHiSysEventApi15', 3, async function (done) {
		console.info('testHiSysEventApi15 start')
		let watcher115
		watcher115 = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				ruleType: hiSysEvent.RuleType.WHOLE_WORD
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi15: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi15: domain is ${info.domain}, name is ${info.name},
            		eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi15: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi15 Onservice died`);
			}
		}
		try {
			hiSysEvent.addWatcher(watcher115)
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT
			},(err, value) => {
				if (err) {
					console.error(`testHiSysEventApi15 json-callback-error code=${err.code}`);
					done();
				} else {
					console.log(`testHiSysEventApi15 json-callback-success value=${value}`);
				}
			});
			console.info('testHiSysEventApi15 end')
		} catch (err) {
			console.error(`testHiSysEventApi15 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi15 end')
			done()
		}
		setTimeout(() => {
			hiSysEvent.removeWatcher(watcher115)
			done()
		}, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1600
	 * @tc.name testHiSysEventApi16
	 * @tc.desc 验证可成功调用addwatcher接口，订阅规则tag, rule=PREFIX
	 */
	it('testHiSysEventApi16', 3, async function (done) {
		console.info('testHiSysEventApi16 start')
		let watcher116
		watcher116 = {
			rules: [{
				domain: "",
				name: "",
				tag: "STABILI",
				ruleType: hiSysEvent.RuleType.PREFIX
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi16: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi16: domain is ${info.domain}, name is ${info.name},
            		eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi16: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi16 Onservice died`);
			}
		}
		try {
			hiSysEvent.addWatcher(watcher116)
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT
			},(err, value) => {
				if (err) {
					console.error(`testHiSysEventApi16 json-callback-error code=${err.code}`);
					done();
				} else {
					console.log(`testHiSysEventApi16 json-callback-success value=${value}`);
				}
			});
			console.info('testHiSysEventApi16 end')
		} catch (err) {
			console.error(`testHiSysEventApi16 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi16 end')
			done()
		}
		setTimeout(() => {
			hiSysEvent.removeWatcher(watcher116)
			done()
		}, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1700
	 * @tc.name testHiSysEventApi17
	 * @tc.desc 验证可成功调用addwatcher接口，订阅规则tag, rule=REGULAR
	 */
	it('testHiSysEventApi17', 3, async function (done) {
		console.info('testHiSysEventApi17 start')
		let watcher117
		watcher117 = {
			rules: [{
				domain: "",
				name: "",
				tag: "STABILI\\w+",
				ruleType: hiSysEvent.RuleType.REGULAR
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi17: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi17: domain is ${info.domain}, name is ${info.name},
            		eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi17: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi17 Onservice died`);
			}
		}
		try {
			hiSysEvent.addWatcher(watcher117)
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT
			},(err, value) => {
				if (err) {
					console.error(`testHiSysEventApi17 json-callback-error code=${err.code}`);
					done()
				} else {
					console.log(`testHiSysEventApi17 json-callback-success value=${value}`);
				}
			});
			console.info('testHiSysEventApi17 end')
		} catch (err) {
			console.error(`testHiSysEventApi17 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi17 end')
			done()
		}
		setTimeout(() => {
			hiSysEvent.removeWatcher(watcher117)
			done()
		}, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1800
	 * @tc.name testHiSysEventApi18
	 * @tc.desc 验证可成功调用addwatcher接口，订阅规则tag, rule=WHOLE_WORD
	 */
	it('testHiSysEventApi18', 3, async function (done) {
		console.info('testHiSysEventApi18 start')
		let watcher118
		watcher118 = {
			rules: [{
				domain: "",
				name: "",
				tag: "STABILITY",
				ruleType: hiSysEvent.RuleType.WHOLE_WORD
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi18: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi18: domain is ${info.domain}, name is ${info.name},
            		eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi18: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi18 Onservice died`);
			}
		}
		try {
			hiSysEvent.addWatcher(watcher118)
			hiSysEvent.write({
				domain: "RELIABILITY",
				name: "STACK",
				eventType: hiSysEvent.EventType.FAULT
			},(err, value) => {
				if (err) {
					console.error(`testHiSysEventApi18 json-callback-error code=${err.code}`);
					done();
				} else {
					console.log(`testHiSysEventApi18 json-callback-success value=${value}`);
				}
			});
			console.info('testHiSysEventApi18 end')
		} catch (err) {
			console.error(`testHiSysEventApi18 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi18 end')
			done()
		}
		setTimeout(() => {
			hiSysEvent.removeWatcher(watcher118)
			done()
		}, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1900
	 * @tc.name testHiSysEventApi19
	 * @tc.desc 验证可添加订阅者后调用removewatcher接口删除订阅者
	 */
	it('testHiSysEventApi19', 3, async function (done) {
		console.info('testHiSysEventApi19 start')
		let watcher119 = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				tag: "STABILITY",
				ruleType: hiSysEvent.RuleType.WHOLE_WORD
			}],
			onEvent: (info) => {
			},
			onServiceDied: () => {
			}
		}
		try {
			hiSysEvent.addWatcher(watcher119)
			hiSysEvent.removeWatcher(watcher119)
			expect(true).assertTrue()
			console.info('testHiSysEventApi19 end')
			done();
		} catch (err) {
			console.error(`testHiSysEventApi19 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi19 error')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_2000
	 * @tc.name testHiSysEventApi20
	 * @tc.desc 验证调用addwatcher接口，可添加20个规则
	 */
	it('testHiSysEventApi20', 3, async function (done) {
		console.info('testHiSysEventApi20 start')
		let msgArray = []
		for (let i = 0; i < 20; i++) {
			msgArray[i] = {
				domain: "RELIABILITY" + i,
				name: "STACK",
				tag: "STABILITY",
				ruleType: hiSysEvent.RuleType.WHOLE_WORD,
			}
		}
		let watcher = {
			rules: msgArray,
			onEvent: (info) => {
			},
			onServiceDied: () => {
			}
		}
		try {
			hiSysEvent.addWatcher(watcher)
		}catch (err) {
			console.error(`testHiSysEventApi20 > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi20 end')
			done()
		}
		hiSysEvent.removeWatcher(watcher)
		done()
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_2100
	 * @tc.name testHiSysEventApi21
	 * @tc.desc 验证调用addwatcher接口，可添加20个订阅者
	 */
	it('testHiSysEventApi21', 3, async function (done) {
		console.info('testHiSysEventApi21 start')
		let maxNumber = 20
		var watcher = []
		try {
			for (var i = 0; i < maxNumber; i++) {
				watcher[i] = {
					rules: [{
						domain: "RELIABILITY" + i,
						name: "STACK",
						ruleType: hiSysEvent.RuleType.WHOLE_WORD,
					}],
					onEvent: (info) => {
					},
					onServiceDied: () => {
					}
				}
				hiSysEvent.addWatcher(watcher[i])
			}
			expect(true).assertTrue()
		}catch (err) {
			console.error(`testHiSysEventApi21 > addWatcher error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			done()
		}
		try {
			for (var j = 0; j < maxNumber; j++) {
				hiSysEvent.removeWatcher(watcher[j])
			}
			console.info('testHiSysEventApi21 remove end')
			done()
		}catch (err) {
			console.error(`testHiSysEventApi21 > remove error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_2200
	 * @tc.name testHiSysEventApi22
	 * @tc.desc 验证调用query接口，可添加100条查询规则
	 */
	it('testHiSysEventApi22', 3, async function (done) {
		console.info('testHiSysEventApi22 start')
		try {
			let msgArray = []
			for (let i = 0; i < 100; i++) {
				msgArray[i] = {
					domain: "RELIABILITY",
					names: ["SYS_FREEZE"],
				}
			}
			hiSysEvent.query({
				beginTime: -1,
				endTime: -1,
				maxEvents: 1,
			}, msgArray, {
				onQuery: function (infos) {
					console.info(`testHiSysEventApi22: onQuery...`)
				},
				onComplete: function(reason, total) {
					console.info(`testHiSysEventApi22: onComplete...`)
					console.info(`testHiSysEventApi22: reason is ${reason}, total is ${total}`)
					expect(reason == 0).assertTrue()
					console.info(`testHiSysEventApi22 end`)
				}
			})
			done()
		} catch (err) {
			console.error(`testHiSysEventApi22 delay > error code: ${err.code}, error msg: ${err.message}`)
			expect(false).assertTrue()
			console.info('testHiSysEventApi22 error')
			done()
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_2400
	 * @tc.name testHiSysEventApi24
	 * @tc.desc HiSysEvent查询接口测试-查询成功回调函数被调用（查询一个事件）
	 */
	it('testHiSysEventApi24', 1, async function (done) {
		console.info('testHiSysEventApi24 start')
		try {
			hiSysEvent.write({
				domain: "ACCOUNT",
				name: "PERMISSION_EXCEPTION",
				eventType: hiSysEvent.EventType.SECURITY,
				params: {
					PID: 487
				}
			},(err, value) => {
				if (err) {
				} else {
				}
			});
			setTimeout(() => {
				hiSysEvent.query({
					beginTime: -1,
					endTime: -1,
					maxEvents: 1,
				}, [{
					domain: "ACCOUNT",
					names: ["PERMISSION_EXCEPTION"],
				}], {
					onQuery: function (infos) {
						console.info(`testHiSysEventApi24: onQuery...`)
						expect(infos.length >= 0).assertTrue()
						console.info(`testHiSysEventApi24: infos.size is ${infos.length}`)
						if (infos instanceof Array) {
							for (let i = 0; i < infos.length; i++) {
								let item = infos[i];
								console.info(`testHiSysEventApi24: domain is ${item.domain}, name is ${item.name},
																   eventType is ${item.eventType}`)
								if (item.params instanceof Object) {
									for (const key in item.params) {
										console.info(`testHiSysEventApi24: ${key}: ${item.params[key]}`)
									}
								}
							}
						}
					},
					onComplete: function(reason, total) {
						console.info(`testHiSysEventApi24: onComplete...`)
						console.info(`testHiSysEventApi24: reason is ${reason}, total is ${total}`)
						expect(reason == 0).assertTrue()
						done()
						console.info(`testHiSysEventApi24 end`)
					}
				})
			}, 2000);
		} catch (error) {
			expect(false).assertTrue()
			console.error(`error code: ${error.code}, error msg: ${error.message}`);
		}
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_2500
	 * @tc.name testHiSysEventApi25
	 * @tc.desc HiSysEvent查询接口测试-查询成功回调函数被调用（查询多个事件）
	 */
	it('testHiSysEventApi25', 1, async function (done) {
		console.info('testHiSysEventApi25 start')
		try {
			hiSysEvent.write({
				domain: "HIVIEWDFX",
				name: "SYS_USAGE",
				eventType: hiSysEvent.EventType.STATISTIC,
			},(err, value) => {
				if (err) {
				} else {
				}
			});
			console.info('add second..')
			setTimeout(() => {
				hiSysEvent.write({
					domain: "HIVIEWDFX",
					name: "PLUGIN_STATS",
					eventType: hiSysEvent.EventType.STATISTIC,
				},(err, value) => {
					if (err) {
					} else {
					}
				})
			},1000)
			setTimeout(() => {
				hiSysEvent.query({
					beginTime: -1,
					endTime: -1,
					maxEvents: 5,
				}, [{
					domain: "HIVIEWDFX",
					names: ["SYS_USAGE","PLUGIN_STATS"],
				}], {
					onQuery: function (infos) {
						console.info(`testHiSysEventApi25: onQuery...`)
						expect(infos.length >= 0).assertTrue()
						console.info(`testHiSysEventApi25: infos.size is ${infos.length}`)
						if (infos instanceof Array) {
							for (let i = 0; i < infos.length; i++) {
								let item = infos[i];
								console.info(`testHiSysEventApi25: domain is ${item.domain}, name is ${item.name},
																   eventType is ${item.eventType}`)
								if (item.params instanceof Object) {
									for (const key in item.params) {
										console.info(`testHiSysEventApi25: ${key}: ${item.params[key]}`)
									}
								}
							}
						}
					},
					onComplete: function(reason, total) {
						console.info(`testHiSysEventApi25: onComplete...`)
						console.info(`testHiSysEventApi25: reason is ${reason}, total is ${total}`)
						expect(reason == 0).assertTrue()
						done()
						console.info(`testHiSysEventApi25 end`)
					}
				})
			}, 2000);
		} catch (error) {
			expect(false).assertTrue()
			console.error(`error code: ${error.code}, error msg: ${error.message}`);
		}
	})
})
}
