/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

export interface RawProps {
  prop?: 'front' | 'back';
}

export class PropsSelector {
  public rawProps: RawProps;

  constructor(rawProps: RawProps) {
    this.rawProps = rawProps;
  }

  get prop() {
    return this.rawProps.prop;
  }
}

export enum CameraTypeTest1 {
  Front = 'front'
}

export interface CameraTypesTest1 {
  prop?: CameraTypeTest1;
}


export enum CameraTypeTest2 {
  Front = 'front',
  Back = 'back'
}

export interface CameraTypesTest2 {
  prop?: CameraTypeTest2;
}


export enum CameraTypeTest3 {
  Front = 'front',
  Back = 'back',
  Back1 = 'back1'
}

export interface CameraTypesTest3 {
  prop?: CameraTypeTest3;
}


// testcase : Literal Types and Union Primitive Type
export class ClassTest {
  private props: PropsSelector;

  constructor(props: PropsSelector) {
    this.props = props;
  }

  testCase1() {
    let ret = this.props.prop as CameraTypeTest1;
    let ret1 = this.props as CameraTypesTest1;
    return ret1.prop === ret;
  }

  testCase2() {
    let ret = this.props.prop as CameraTypeTest2;
    let ret1 = this.props as CameraTypesTest2;
    return ret1.prop === ret;
  }

  testCase3() {
    let ret = this.props.prop as CameraTypeTest3;
    let ret1 = this.props as CameraTypesTest3;
    return ret1.prop === ret;
  }
}