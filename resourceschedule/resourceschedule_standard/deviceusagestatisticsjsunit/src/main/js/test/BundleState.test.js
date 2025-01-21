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

import bundlestate from '@ohos.bundleState';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'

function onInit() {
	let obj = {startTime: 0,endTime: 0};
	const myTime = new Date().getTime();
	obj.startTime = myTime - 86400000;
	obj.endTime = myTime
	return obj;
}
let bundleName = 'com.example.backgroundTaskManager';
const byInterval = bundlestate.IntervalType.BY_DAILY;
const toMerge = {
	"abilityInFgTotalTime": 0,
	"abilityPrevAccessTime": 1629907200000,
	"abilityPrevSeenTime": 0,
	"abilitySeenTotalTime": 0,
	"bundleName": "com.example.backgroundTaskManager",
	"fgAbilityAccessTotalTime": 0,
	"fgAbilityPrevAccessTime": 0,
	"id": 0,
	"infosBeginTime": 1629907200000,
	"infosEndTime": 1629993599999
}
export default function bundlestate_test() {
describe('bundlestate_test', function() {
	console.info('Start test tvmw bundlestate######################');
	beforeAll(function() {
		console.info('beforeAll')
	})
	
	afterAll(function() {
		console.info('afterAll begin')
	})
	
	beforeEach(function() {
		console.info('beforeEach caled')
	})
	
	afterEach(function() {
		console.info('afterEach caled')
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0024
     * @tc.name: merge_024.
     * @tc.desc: Execute merge with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('merge_024', 0, function(done) {
		console.info('bundle merge_024 start');
		let toMerge02 = {
			"abilityInFgTotalTime": 0,
			"abilityPrevAccessTime": 1629907200000,
			"abilityPrevSeenTime": 0,
			"abilitySeenTotalTime": 0,
			"bundleName": "com.example.backgroundTaskManager",
			"fgAbilityAccessTotalTime": 0,
			"fgAbilityPrevAccessTime": 0,
			"id": 0,
			"infosBeginTime": 1629907200000,
			"infosEndTime": 1629993599999,
		};
		try {
			let ret = bundlestate.BundleStateInfo.merge(toMerge02);
			expect(ret).assertUndefined()
		} catch(e) {
			console.info('bundle merge_024 failed');
			let err = 0;
			expect(err).assertEqual(0);
		}
		done();
		console.info('merge_024 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0025
     * @tc.name: merge_025.
     * @tc.desc: Execute merge with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('merge_025', 0, function(done) {
		console.info('bundle merge_025 start');
		let toMerge03 = {
			"abilityInFgTotalTime": 'text',
			"abilityPrevAccessTime": 'text',
			"abilityPrevSeenTime": 'text',
			"abilitySeenTotalTime": 'text',
			"bundleName": "com.example.backgroundTaskManager",
			"fgAbilityAccessTotalTime": 'text',
			"fgAbilityPrevAccessTime": 'text',
			"id": 'text',
			"infosBeginTime": 'text',
			"infosEndTime": 'text',
		};
		try {
			let ret = bundlestate.BundleStateInfo.merge(toMerge03);
			expect(ret).assertUndefined()
		} catch(e) {
			console.info('bundle merge_025 failed');
			let err = 0;
			expect(err).assertEqual(0);
		}
		done();
		console.info('merge_025 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_0026
     * @tc.name: merge_026.
     * @tc.desc: Execute merge with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('merge_026', 0, function(done) {
		console.info('bundle merge_026 start');
		try {
			let ret = bundlestate.BundleStateInfo.merge(null);
			expect(ret).assertUndefined()
		} catch(e) {
			console.info('bundle merge_026 failed');
			let err = 0;
			expect(err).assertEqual(0);
		}
		done();
		console.info('merge_026 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_0027
     * @tc.name: merge_027.
     * @tc.desc: Execute merge with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('merge_027', 0, function(done) {
		console.info('bundle merge_027 start');
		try {
			let ret = bundlestate.BundleStateInfo.merge(true);
			expect(ret).assertUndefined()
		} catch(e) {
			console.info('bundle merge_027 failed');
			let err = 0;
			expect(err).assertEqual(0);
		}
		done();
		console.info('merge_027 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_0028
     * @tc.name: merge_028.
     * @tc.desc: Execute merge with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('merge_028', 0, function(done) {
		console.info('bundle merge_028 start');
		try {
			let ret = bundlestate.BundleStateInfo.merge(123);
			expect(ret).assertUndefined()
		} catch(e) {
			console.info('bundle merge_028 failed');
			let err = 0;
			expect(err).assertEqual(0);
		}
		done();
		console.info('merge_028 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0052
     * @tc.name: isIdleState_052.
     * @tc.desc: Execute isIdleState with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_052', 0, async function(done) {
		console.info('isIdleState_052 start');
		bundlestate.isIdleState(bundleName, (err, res) => {
			if(err) {
				console.info('isIdleState_052 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('isIdleState_052 callback success result = ' + JSON.stringify(res));
				if(res) {
					expect(res).assertTrue();
				} else {
					expect(res).assertFalse();
				}
			}
			done();
		});
		console.info('isIdleState_052 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0053
     * @tc.name: isIdleState_053.
     * @tc.desc: Execute isIdleState with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_053', 0, async function(done) {
		console.info('isIdleState_053 start');
		let bundleName02 = 'ohos.plrdtest.resourceschedule'
		bundlestate.isIdleState(bundleName02, (err, res) => {
			if(err) {
				console.info('isIdleState_053 callback fail result = ' + err);
			} else {
				console.info('isIdleState_053 callback success result = ' + JSON.stringify(res));
				expect(res).assertInstanceOf('Boolean');
			};
			done();
		});
		console.info('isIdleState_053 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0054
     * @tc.name: isIdleState_054.
     * @tc.desc: Execute isIdleState with promise.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_054', 0, async function(done) {
		console.info('isIdleState_054 start');
		bundlestate.isIdleState(bundleName).then((data) => {
			console.info('isIdleState_054 promise success result = ' + JSON.stringify(data));
			if(res) {
				expect(res).assertTrue();
			} else {
				expect(res).assertFalse();
			};
			done();
		}).catch((err) => {
			console.info('isIdleState_054 promise fail result = ' + JSON.stringify(err.code));
			expect(err.code).assertUndefined();
			done();
		})
		console.info('isIdleState_054 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0055
     * @tc.name: isIdleState_055.
     * @tc.desc: Execute isIdleState with promise.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_055', 0, async function(done) {
		console.info('isIdleState_055 start');
		let bundleName31 = 'ohos.plrdtest.resourceschedule'
		bundlestate.isIdleState(bundleName31).then((res) => {
			console.info('isIdleState_055 promise success result = ' + res);
			expect(res).assertFalse();
		}).catch((err) => {
			console.info('isIdleState_055 promise fail result = ' + JSON.stringify(err));
			expect(err.code).assertLarger(0);
		})
		done();
		console.info('isIdleState_055 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0056
     * @tc.name: isIdleState_056.
     * @tc.desc: Execute isIdleState with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_056', 0, async function(done) {
		console.info('isIdleState_056 start');
		bundlestate.isIdleState(123, (err, data) => {
			if(err) {
				console.info('isIdleState_056 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('isIdleState_056 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('isIdleState_056 end');
	})

	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0062
     * @tc.name: isIdleState_062.
     * @tc.desc: Execute isIdleState with Promise.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_062', 0, async function(done) {
		console.info('isIdleState_062 start');
		bundlestate.isIdleState(123).then((res) => {
			console.info('isIdleState_062 promise success result = ' + JSON.stringify(res));
			expect(res).assertFail();
		}).catch((err) => {
			console.info('isIdleState_062 promise fail result = ' + JSON.stringify(err));
			expect(err.code).assertLarger(0);
		})
		done();
		console.info('isIdleState_062 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0057
     * @tc.name: isIdleState_057.
     * @tc.desc: Execute isIdleState with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_057', 0, async function(done) {
		console.info('isIdleState_057 start');
		bundlestate.isIdleState(null, (err, data) => {
			if(err) {
				console.info('isIdleState_057 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('isIdleState_057 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('isIdleState_057 end');
	})

	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0063
     * @tc.name: isIdleState_063.
     * @tc.desc: Execute isIdleState with Promise.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_063', 0, async function(done) {
		console.info('isIdleState_063 start');
		bundlestate.isIdleState(null).then((res) => {
			console.info('isIdleState_063 promise success result = ' + JSON.stringify(res));
			expect(res).assertFail();
		}).catch((err) => {
			console.info('isIdleState_063 promise fail result = ' + JSON.stringify(err));
			expect(err.code).assertLarger(0);
		})
		done();
		console.info('isIdleState_063 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0058
     * @tc.name: isIdleState_058.
     * @tc.desc: Execute isIdleState with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_058', 0, async function(done) {
		console.info('isIdleState_058 start');
		bundlestate.isIdleState(true, (err, data) => {
			if(err) {
				console.info('isIdleState_058 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('isIdleState_058 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('isIdleState_058 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0059
     * @tc.name: isIdleState_059.
     * @tc.desc: Execute isIdleState with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_059', 0, async function(done) {
		console.info('isIdleState_059 start');
		bundlestate.isIdleState(false, (err, data) => {
			if(err) {
				console.info('isIdleState_059 callback fail result = ' + JSON.stringify(err));
				expect(err.code).assertLarger(0);
			} else {
				console.info('isIdleState_059 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('isIdleState_059 end');
	})

	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0064
     * @tc.name: isIdleState_064.
     * @tc.desc: Execute isIdleState with Promise.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_064', 0, async function(done) {
		console.info('isIdleState_064 start');
		bundlestate.isIdleState(false).then((res) => {
			console.info('isIdleState_064 promise success result = ' + JSON.stringify(res));
			expect(res).assertFail();
		}).catch((err) => {
			console.info('isIdleState_064 promise fail result = ' + JSON.stringify(err));
			expect(err.code).assertLarger(0);
		})
		done();
		console.info('isIdleState_064 end');
	})
	
	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0060
     * @tc.name: isIdleState_060.
     * @tc.desc: Execute isIdleState with callback.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_060', 0, async function(done) {
		console.info('isIdleState_060 start');
		bundlestate.isIdleState('', (err, data) => {
			if(err) {
				console.info('isIdleState_060 callback fail result = ' + JSON.stringify(err.code));
				expect(err.code).assertLarger(0);
			} else {
				console.info('isIdleState_060 callback success result = ' + JSON.stringify(data));
				expect(data).assertFail();
			}
			done();
		});
		console.info('isIdleState_060 end');
	})

	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_0061
     * @tc.name: isIdleState_061.
     * @tc.desc: Execute isIdleState with Promise.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_061', 0, async function(done) {
		console.info('isIdleState_061 start');
		bundlestate.isIdleState('').then((res) => {
			console.info('isIdleState_061 promise success result = ' + JSON.stringify(res));
			expect(res).assertFail();
		}).catch((err) => {
			console.info('isIdleState_061 promise fail result = ' + JSON.stringify(err));
			expect(err.code).assertLarger(0);
		})
		done();
		console.info('isIdleState_061 end');
	})

	/*
	 * @tc.number: SUB_INTELLITV_JS_BUNDLE_065
     * @tc.name: isIdleState_065.
     * @tc.desc: Execute isIdleState with Promise.
	 * @tc.size: MEDIUM
     * @tc.type: Function
     * @tc.level: level 0
     */
	it('isIdleState_065', 0, async function(done) {
		console.info('isIdleState_065 start');
		bundlestate.isIdleState(true).then((res) => {
			console.info('isIdleState_065 promise success result = ' + JSON.stringify(res));
			expect(res).assertFail();
		}).catch((err) => {
			console.info('isIdleState_065 promise fail result = ' + JSON.stringify(err));
			expect(err.code).assertLarger(0);
		})
		done();
		console.info('isIdleState_065 end');
	})

})}
