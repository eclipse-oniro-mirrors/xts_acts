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
	 * @tc.number DFX_DFT_HiSysEvent_JS_0400
	 * @tc.name testHiSysEventApi04
	 * @tc.desc HiSysEvent添加Js打点事件-添加成功后回调函数被调用(domain+eventName, eventType=FAULT)
	 */
	it('testHiSysEventApi04', 3, async function (done) {
		console.info('testHiSysEventApi04 start')
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
		console.info('testHiSysEventApi04 end')
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_0500
	 * @tc.name testHiSysEventApi05
	 * @tc.desc 添加Js打点事件-添加成功后回调函数被调用(domain+eventName, eventType=STATISTIC)
	 */
	it('testHiSysEventApi05', 3, async function (done) {
		console.info('testHiSysEventApi05 start')
		hiSysEvent.write({
			domain: "HIVIEWDFX",
			name: "PLUGIN_STATS",
			eventType: hiSysEvent.EventType.STATISTIC,
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
		console.info('testHiSysEventApi05 end')
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_0600
	 * @tc.name testHiSysEventApi06
	 * @tc.desc 添加Js打点事件-添加成功后回调函数被调用(domain+eventName, eventType=SECURITY)
	 */
	it('testHiSysEventApi06', 3, async function (done) {
		console.info('testHiSysEventApi06 start')
		hiSysEvent.write({
			domain: "ACCOUNT",
			name: "PERMISSION_EXCEPTION",
			eventType: hiSysEvent.EventType.SECURITY,
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
		console.info('testHiSysEventApi06 end')
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_0700
	 * @tc.name testHiSysEventApi07
	 * @tc.desc 添加Js打点事件-添加成功后回调函数被调用(domain+eventName, eventType=BEHAVIOR)
	 */
	it('testHiSysEventApi07', 3, async function (done) {
		console.info('testHiSysEventApi07 start')
		hiSysEvent.write({
			domain: "HIVIEWDFX",
			name: "PLUGIN_LOAD",
			eventType: hiSysEvent.EventType.BEHAVIOR,
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
		console.info('testHiSysEventApi07 end')
	})

    /**
	 * @tc.number DFX_DFT_HiSysEvent_JS_0800
	 * @tc.name testHiSysEventApi08
	 * @tc.desc 添加Js打点事件-添加成功后回调函数被调用(domain+eventName+params, eventType=FAULT)
     */
	it('testHiSysEventApi08', 3, async function (done) {
		console.info('testHiSysEventApi08 start')
		hiSysEvent.write({
			domain: "RELIABILITY",
			name: "STACK",
			eventType: hiSysEvent.EventType.FAULT,
			params: {
				PID: 487,
				UID: 103,
				PACKAGE_NAME: "com.ohos.hisysevent.test",
				PROCESS_NAME: "syseventservice",
				MSG: "no msg."
			}
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
		console.info('testHiSysEventApi08 end')
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_0900
	 * @tc.name testHiSysEventApi09
	 * @tc.desc HiSysEvent添加Js打点事件-添加成功后回调函数被调用(domain+eventName+params, eventType=STATISTIC)
	 */
	it('testHiSysEventApi09', 3, async function (done) {
		console.info('testHiSysEventApi09 start')
		hiSysEvent.write({
			domain: "HIVIEWDFX",
			name: "PLUGIN_STATS",
			eventType: hiSysEvent.EventType.STATISTIC,
			params: {
				PID: 487,
				UID: 103,
				PACKAGE_NAME: "com.ohos.hisysevent.test",
				PROCESS_NAME: "syseventservice",
				MSG: "no msg."
			}
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
		console.info('testHiSysEventApi09 end')
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1000
	 * @tc.name testHiSysEventApi10
	 * @tc.desc HiSysEvent添加Js打点事件-添加成功后回调函数被调用(domain+eventName+params, eventType=SECURITY)
	 */
	it('testHiSysEventApi10', 3, async function (done) {
		console.info('testHiSysEventApi10 start')
		hiSysEvent.write({
			domain: "ACCOUNT",
			name: "PERMISSION_EXCEPTION",
			eventType: hiSysEvent.EventType.SECURITY,
			params: {
				PID: 487,
				UID: 103,
				PACKAGE_NAME: "com.ohos.hisysevent.test",
				PROCESS_NAME: "syseventservice",
				MSG: "no msg."
			}
		},(err, value) => {
			console.log('testHiSysEventApi10 into json-callback');
			if (err) {
				console.error(`testHiSysEventApi10 json-callback-error code=${err.code}`);
				expect(err.code == 0).assertFail();
				done();
			} else {
				console.log(`testHiSysEventApi10 json-callback-success value=${value}`);
				expect(value == 0).assertTrue();
				done();
			}
		});
		console.info('testHiSysEventApi10 end')
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1100
	 * @tc.name testHiSysEventApi11
	 * @tc.desc HiSysEvent添加Js打点事件-添加成功后回调函数被调用(domain+eventName+params, eventType=BEHAVIOR)
	 */
	it('testHiSysEventApi11', 3, async function (done) {
		console.info('testHiSysEventApi11 start')
		hiSysEvent.write({
			domain: "HIVIEWDFX",
			name: "PLUGIN_LOAD",
			eventType: hiSysEvent.EventType.BEHAVIOR,
			params: {
				PID: 487,
				UID: 103,
				PACKAGE_NAME: "com.ohos.hisysevent.test",
				PROCESS_NAME: "syseventservice",
				MSG: "no msg."
			}
		},(err, value) => {
			console.log('testHiSysEventApi11 into json-callback');
			if (err) {
				console.error(`testHiSysEventApi11 json-callback-error code=${err.code}`);
				expect(err.code == 0).assertFail();
				done();
			} else {
				console.log(`testHiSysEventApi11 json-callback-success value=${value}`);
				expect(value == 0).assertTrue();
				done();
			}
		});
		console.info('testHiSysEventApi11 end')
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1200
	 * @tc.name testHiSysEventApi12
	 * @tc.desc HiSysEvent订阅接口测试-订阅成功回调函数被调用(domain+eventName, rule=PREFIX)
	 */
	it('testHiSysEventApi12', 3, async function (done) {
		console.info('testHiSysEventApi12 start')
		let watcher = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				tag: "STABILITY",
				ruleType: hiSysEvent.RuleType.PREFIX
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi12: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi12: domain is : ${info.domain}, name is ${info.name},
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
			hiSysEvent.addWatcher(watcher)
			expect(true).assertTrue()
			console.info('testHiSysEventApi12 end')
			done();
		} catch (err) {
			console.error(`testHiSysEventApi12 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 201).assertTrue()
			console.info('testHiSysEventApi12 end')
			done()
		}
		hiSysEvent.removeWatcher(watcher)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1300
	 * @tc.name testHiSysEventApi13
	 * @tc.desc HiSysEvent订阅接口测试-订阅成功回调函数被调用(domain+eventName, rule=REGULAR)
	 */
	it('testHiSysEventApi13', 3, async function (done) {
		console.info('testHiSysEventApi13 start')
		let watcher = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				ruleType: hiSysEvent.RuleType.REGULAR
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi13: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi13: domain is : ${info.domain}, name is ${info.name},
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
			hiSysEvent.addWatcher(watcher)
			expect(true).assertTrue()
			console.info('testHiSysEventApi13 end')
			done();
		} catch (err) {
			console.error(`testHiSysEventApi13 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 201).assertTrue()
			console.info('testHiSysEventApi13 end')
			done()
		}
		hiSysEvent.removeWatcher(watcher)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1400
	 * @tc.name testHiSysEventApi14
	 * @tc.desc HiSysEvent订阅接口测试-订阅成功回调函数被调用(domain+eventName, rule=WHOLE_WORD)
	 */
	it('testHiSysEventApi14', 3, async function (done) {
		console.info('testHiSysEventApi14 start')
		let watcher = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				ruleType: hiSysEvent.RuleType.WHOLE_WORD
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi14: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi14: domain is : ${info.domain}, name is ${info.name},
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
			hiSysEvent.addWatcher(watcher)
			expect(true).assertTrue()
			console.info('testHiSysEventApi14 end')
			done();
		} catch (err) {
			console.error(`testHiSysEventApi14 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 201)
			console.info('testHiSysEventApi14 end')
			done()
		}
		hiSysEvent.removeWatcher(watcher)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1500
	 * @tc.name testHiSysEventApi15
	 * @tc.desc HiSysEvent订阅接口测试-订阅成功回调函数被调用(domain+eventName+tag, rule=PREFIX)
	 */
	it('testHiSysEventApi15', 3, async function (done) {
		console.info('testHiSysEventApi15 start')
		let watcher = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				tag: "STABILITY",
				ruleType: hiSysEvent.RuleType.PREFIX
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi15: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi15: domain is : ${info.domain}, name is ${info.name},
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
			hiSysEvent.addWatcher(watcher)
			expect(true).assertTrue()
			console.info('testHiSysEventApi15 end')
			done();
		} catch (err) {
			console.error(`testHiSysEventApi15 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 201).assertTrue()
			console.info('testHiSysEventApi15 end')
			done()
		}
		hiSysEvent.removeWatcher(watcher)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1600
	 * @tc.name testHiSysEventApi16
	 * @tc.desc HiSysEvent订阅接口测试-订阅成功回调函数被调用(domain+eventName+tag, rule=REGULAR)
	 */
	it('testHiSysEventApi16', 3, async function (done) {
		console.info('testHiSysEventApi16 start')
		let watcher = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				tag: "STABILITY",
				ruleType: hiSysEvent.RuleType.REGULAR
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi16: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi16: domain is : ${info.domain},
				              name is ${info.name}, eventType is ${info.eventType}`)
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
			hiSysEvent.addWatcher(watcher)
			expect(true).assertTrue()
			console.info('testHiSysEventApi16 end')
			done();
		} catch (err) {
			console.error(`testHiSysEventApi16 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 201).assertTrue()
			console.info('testHiSysEventApi16 end')
			done()
		}
		hiSysEvent.removeWatcher(watcher)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1700
	 * @tc.name testHiSysEventApi17
	 * @tc.desc HiSysEvent订阅接口测试-订阅成功回调函数被调用(domain+eventName+tag, rule=WHOLE_WORD)
	 */
	it('testHiSysEventApi17', 3, async function (done) {
		console.info('testHiSysEventApi17 start')
		let watcher = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				tag: "STABILITY",
				ruleType: hiSysEvent.RuleType.WHOLE_WORD
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi17: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi17: domain is : ${info.domain}, name is ${info.name},
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
			hiSysEvent.addWatcher(watcher)
			expect(true).assertTrue()
			console.info('testHiSysEventApi17 end')
			done();
		} catch (err) {
			console.error(`testHiSysEventApi17 > error code: ${err.code}, error msg: ${err.message}`)
			expect(err.code == 201).assertTrue()
			console.info('testHiSysEventApi17 end')
			done()
		}
		hiSysEvent.removeWatcher(watcher)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1800
	 * @tc.name testHiSysEventApi18
	 * @tc.desc HiSysEvent删除订阅接口测试-删除订阅成功回调函数被调用(domain+eventName, rule=PREFIX)
	 */
	it('testHiSysEventApi18', 3, async function (done) {
		console.info('testHiSysEventApi18 start')
		let watcher = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				ruleType: hiSysEvent.RuleType.PREFIX
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi18: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi18: domain is : ${info.domain}, name is ${info.name},
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
		hiSysEvent.addWatcher(watcher)
		setTimeout(() => {
			try {
				hiSysEvent.removeWatcher(watcher)
				expect(true).assertTrue()
				console.info('testHiSysEventApi18 end')
				done();
			} catch (err) {
				console.error(`testHiSysEventApi18 > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 201).assertTrue()
				console.info('testHiSysEventApi18 end')
				done()
			}
        }, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_1900
	 * @tc.name testHiSysEventApi19
	 * @tc.desc HiSysEvent删除订阅接口测试-删除订阅成功回调函数被调用(domain+eventName, rule=REGULAR)
	 */
	it('testHiSysEventApi19', 3, async function (done) {
		console.info('testHiSysEventApi19 start')
		let watcher = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				ruleType: hiSysEvent.RuleType.REGULAR
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi19: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi19: domain is : ${info.domain}, name is ${info.name},
				                                                               eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi19: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi19 Onservice died`);
			}
		}
		hiSysEvent.addWatcher(watcher)
		setTimeout(() => {
			try {
				hiSysEvent.removeWatcher(watcher)
				expect(true).assertTrue()
				console.info('testHiSysEventApi19 end')
				done();
			} catch (err) {
				console.error(`testHiSysEventApi19 > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 201).assertTrue()
				console.info('testHiSysEventApi19 end')
				done()
			}
        }, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_2000
	 * @tc.name testHiSysEventApi20
	 * @tc.desc HiSysEvent删除订阅接口测试-删除订阅成功回调函数被调用(domain+eventName, rule=WHOLE_WORD)
	 */
	it('testHiSysEventApi20', 3, async function (done) {
		console.info('testHiSysEventApi14 start')
		let watcher = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				ruleType: hiSysEvent.RuleType.WHOLE_WORD
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi20: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi20: domain is : ${info.domain}, name is ${info.name},
				                                                               eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi20: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi20 Onservice died`);
			}
		}
		hiSysEvent.addWatcher(watcher)
		setTimeout(() => {
			try {
				hiSysEvent.removeWatcher(watcher)
				expect(true).assertTrue()
				console.info('testHiSysEventApi20 end')
				done();
			} catch (err) {
				console.error(`testHiSysEventApi20 > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 201).assertTrue()
				console.info('testHiSysEventApi20 end')
				done()
			}
        }, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_2100
	 * @tc.name testHiSysEventApi21
	 * @tc.desc HiSysEvent删除订阅接口测试-删除订阅成功回调函数被调用(domain+eventName+tag, rule=PREFIX)
	 */
	it('testHiSysEventApi21', 3, async function (done) {
		console.info('testHiSysEventApi21 start')
		let watcher = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				tag: "STABILITY",
				ruleType: hiSysEvent.RuleType.PREFIX
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi21: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi21: domain is : ${info.domain}, name is ${info.name},
				                                                               eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi21: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi21 Onservice died`);
			}
		}
		hiSysEvent.addWatcher(watcher)
		setTimeout(() => {
			try {
				hiSysEvent.removeWatcher(watcher)
				expect(true).assertTrue()
				console.info('testHiSysEventApi21 end')
				done();
			} catch (err) {
				console.error(`testHiSysEventApi21 > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 201).assertTrue()
				console.info('testHiSysEventApi21 end')
				done()
			}
        }, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_2200
	 * @tc.name testHiSysEventApi22
	 * @tc.desc HiSysEvent删除订阅接口测试-删除订阅成功回调函数被调用(domain+eventName+tag, rule=REGULAR)
	 */
	it('testHiSysEventApi22', 3, async function (done) {
		console.info('testHiSysEventApi22 start')
		let watcher = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				tag: "STABILITY",
				ruleType: hiSysEvent.RuleType.REGULAR
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi22: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi22: domain is : ${info.domain}, name is ${info.name},
				                                                               eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi22: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi22 Onservice died`);
			}
		}
		hiSysEvent.addWatcher(watcher)
		setTimeout(() => {
			try {
				hiSysEvent.removeWatcher(watcher)
				expect(true).assertTrue()
				console.info('testHiSysEventApi22 end')
				done();
			} catch (err) {
				console.error(`testHiSysEventApi22 > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 201).assertTrue()
				console.info('testHiSysEventApi22 end')
				done()
			}
        }, 1000)
	})

	/**
	 * @tc.number DFX_DFT_HiSysEvent_JS_2300
	 * @tc.name testHiSysEventApi23
	 * @tc.desc HiSysEvent删除订阅接口测试-删除订阅成功回调函数被调用(domain+eventName+tag, rule=WHOLE_WORD)
	 */
	it('testHiSysEventApi23', 3, async function (done) {
		console.info('testHiSysEventApi23 start')
		let watcher = {
			rules: [{
				domain: "RELIABILITY",
				name: "STACK",
				tag: "STABILITY",
				ruleType: hiSysEvent.RuleType.WHOLE_WORD
			}],
			onEvent: (info) => {
				console.info(`testHiSysEventApi23: OnEvent...`)
				expect(Object.keys(info).length > 0).assertTrue()
				console.info(`testHiSysEventApi23: domain is : ${info.domain}, name is ${info.name},
				                                                               eventType is ${info.eventType}`)
				if (info.params instanceof Object) {
					for (const key in info.params) {
						console.info(`testHiSysEventApi23: ${key}: ${info.params[key]}`)
					}
				}
			},
			onServiceDied: () => {
				console.info(`testHiSysEventApi23 Onservice died`);
			}
		}
		hiSysEvent.addWatcher(watcher)
		setTimeout(() => {
			try {
				hiSysEvent.removeWatcher(watcher)
				expect(true).assertTrue()
				console.info('testHiSysEventApi23 end')
				done();
			} catch (err) {
				console.error(`testHiSysEventApi23 > error code: ${err.code}, error msg: ${err.message}`)
				expect(err.code == 201).assertTrue()
				console.info('testHiSysEventApi23 end')
				done()
			}
        }, 1000)
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
					PID: 487,
					UID: 103,
					PACKAGE_NAME: "com.ohos.hisysevent.test",
					PROCESS_NAME: "syseventservice",
					MSG: "no msg."
				}
			},(err, value) => {
				console.log('testHiSysEventApi24 into json-callback');
				if (err) {
					console.error('in testHiSysEventApi24 test callback: err.code = ' + err.code)
				} else {
					console.info('in testHiSysEventApi24 test callback: result = ' + value)
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
						done()
						console.info(`testHiSysEventApi24 end`)
					}
				})
			}, 1000);
		} catch (error) {
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
				console.log('testHiSysEventApi25 into json-callback');
				if (err) {
					console.error('in testHiSysEventApi25 test callback: err.code = ' + err.code)
				} else {
					console.info('in testHiSysEventApi25 test callback: result = ' + value)
				}
			});
			console.info('add second..')
			setTimeout(() => {
				hiSysEvent.write({
					domain: "HIVIEWDFX",
					name: "PLUGIN_STATS",
					eventType: hiSysEvent.EventType.STATISTIC,
				},(err, value) => {
					console.log('testHiSysEventApi25 into json-callback');
					if (err) {
						console.error('in testHiSysEventApi25 test callback: err.code = ' + err.code)
					} else {
						console.info('in testHiSysEventApi25 test callback: result = ' + value)
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
						done()
						console.info(`testHiSysEventApi25 end`)
					}
				})
			}, 2000);
		} catch (error) {
			console.error(`error code: ${error.code}, error msg: ${error.message}`);
		}
	})
})
}
