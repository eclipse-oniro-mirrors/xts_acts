/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import ExtendTrackTest from './observeTrack/ExtendTrackTest.test';
import NestTrackTest from './observeTrack/NestTrackTest.test';
import ObjectArrayTest from './observeTrack/ObjectArrayTest.test';
import OnlyObserveTest from './observeTrack/OnlyObserveTest.test';
import StaticTrackTest from './observeTrack/StaticTrackTest.test';
import TrackDateTest from './observeTrack/TrackDateTest.test';
import TrackMapTest from './observeTrack/TrackMapTest.test';
import TrackSetTest from './observeTrack/TrackSetTest.test';
import TwoNestTrackTest from './observeTrack/TwoNestTrackTest.test';
import ArrayTrackTest from './observeTrack/ArrayTrackTest.test';
export default function testsuite() {
  ExtendTrackTest();
  NestTrackTest();
  ObjectArrayTest();
  OnlyObserveTest();
  StaticTrackTest();
  TrackDateTest();
  TrackMapTest();
  TrackSetTest();
  TwoNestTrackTest();
  ArrayTrackTest();
}