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
// Union Literal Types
export type Direction = 'up' | 'down' | 'left' | 'right';

export type Size = 'small' | 'medium' | 'large';

export type Status = 'active' | 'inactive' | 'disabled';

export type Mode = 'light' | 'dark' | 'auto';

export type Align = 'start' | 'center' | 'end';

export type Shape = 'circle' | 'square' | 'rectangle';

export type Gender = 'male' | 'female' | 'other';

export type Language = 'zh' | 'en' | 'ja' | 'ko';

export type Network = 'wifi' | '4g' | '5g' | 'offline';

export type Priority = 'low' | 'medium' | 'high' | 'urgent';

// Enum Types
export enum Theme {
  Light = 'light',
  Dark = 'dark',
  Auto = 'auto'
}

export enum Position {
  Top = 'top',
  Bottom = 'bottom',
  Left = 'left',
  Right = 'right'
}

export enum Visibility {
  Visible = 'visible',
  Hidden = 'hidden',
  Collapsed = 'collapsed'
}

export enum Sort {
  Asc = 'asc',
  Desc = 'desc',
  None = 'none'
}

export enum Format {
  Json = 'json',
  Xml = 'xml',
  Csv = 'csv'
}

// Interface Definitions
export interface DirectionProps { dir?: Direction }

export interface SizeProps { size?: Size }

export interface StatusProps { status?: Status }

export interface ModeProps { mode?: Mode }

export interface AlignProps { align?: Align }

export interface ShapeProps { shape?: Shape }

export interface GenderProps { gender?: Gender }

export interface LanguageProps { lang?: Language }

export interface NetworkProps { network?: Network }

export interface PriorityProps { priority?: Priority }

export interface ThemeProps { theme?: Theme }

export interface PositionProps { position?: Position }

export interface VisibilityProps { visibility?: Visibility }

export interface SortProps { sort?: Sort }

export interface FormatProps { format?: Format }

// Combined Interfaces
export interface DirectionAndSizeProps extends DirectionProps, SizeProps {}

export interface StatusAndModeProps extends StatusProps, ModeProps {}

export interface AlignAndShapeProps extends AlignProps, ShapeProps {}

export interface GenderAndLanguageProps extends GenderProps, LanguageProps {}

export interface NetworkAndPriorityProps extends NetworkProps, PriorityProps {}

export interface ThemeAndPositionProps extends ThemeProps, PositionProps {}

export interface VisibilityAndSortProps extends VisibilityProps, SortProps {}

export interface FormatAndDirectionProps extends FormatProps, DirectionProps {}

// Type Selector Class
export class PropsHolder<T> {
  public props: T;

  constructor(props: T) {
    this.props = props;
  }

  get value(): T[keyof T] | undefined {
    const keys = Object.keys(this.props) as (keyof T)[];
    return keys.length > 0 ? this.props[keys[0]] : undefined;
  }
}

export class UnionTypeTest {
  // 1-10: Union Literal vs Single Enum Matching, Union Literal vs Interface Type Conversion (Core Basic Scenarios)
  test1() {
    const holder = new PropsHolder<ModeProps>({ mode: 'dark' });
    const enumVal = Theme.Dark;
    return holder.value === enumVal; // 'dark' vs 'dark' → true
  }

  // 11-20: Combined Interface vs Type Matching (Original 21-30 Scenarios)
  test4() {
    const holder = new PropsHolder<DirectionAndSizeProps>({ dir: 'up', size: 'small' });
    return holder.props.dir === 'up' && holder.props.size === 'small'; // Matching → true
  }

  test6() {
    const holder = new PropsHolder<StatusAndModeProps>({ status: 'inactive', mode: 'auto' });
    return holder.props.status === 'inactive' && holder.props.mode === 'auto'; // Matching → true
  }

  test8() {
    const holder = new PropsHolder<AlignAndShapeProps>({ align: 'center', shape: 'circle' });
    return holder.props.align === 'center' && holder.props.shape === 'circle'; // Matching → true
  }

  test10() {
    const holder = new PropsHolder<GenderAndLanguageProps>({ gender: 'other', lang: 'ja' });
    return holder.props.gender === 'other' && holder.props.lang === 'ja'; // Matching → true
  }

  test12() {
    const holder = new PropsHolder<NetworkAndPriorityProps>({ network: '4g', priority: 'medium' });
    return holder.props.network === '4g' && holder.props.priority === 'medium'; // Matching → true
  }

  // 21-30: Enum vs Union Literal Conversion (Original 31-40 Scenarios)
  test14() {
    const enumVal = Theme.Light;
    const literal: Mode = enumVal as Mode;
    return literal === 'light'; // Conversion matching → true
  }

  test16() {
    const enumVal = Theme.Dark;
    const literal: Mode = enumVal as Mode;
    return literal === 'dark'; // Conversion matching → true
  }

  test17() {
    const enumVal = Position.Left;
    const literal: Direction = enumVal as Direction;
    return literal === 'left'; // Conversion matching → true
  }

  // 31-40: Interface Nesting with Object Literals (Original 41-50 Scenarios)
  test18() {
    const obj: { props: DirectionProps } = { props: { dir: 'right' } };
    return obj.props.dir === 'right'; // Matching → true
  }

  test20() {
    const obj: { state: StatusProps } = { state: { status: 'disabled' } };
    return obj.state.status === 'disabled'; // Matching → true
  }

  test22() {
    const obj: { align: AlignProps } = { align: { align: 'start' } };
    return obj.align.align === 'start'; // Matching → true
  }

  test24() {
    const obj: { user: GenderProps } = { user: { gender: 'female' } };
    return obj.user.gender === 'female'; // Matching → true
  }

  test26() {
    const obj: { net: NetworkProps } = { net: { network: 'wifi' } };
    return obj.net.network === 'wifi'; // Matching → true
  }

  // 41-50: Type Judgment in Class Methods (Original 51-60 Scenarios)
  test28() {
    const holder = new PropsHolder<DirectionProps>({ dir: 'up' });
    return this.isDirection(holder.value, 'up'); // Matching → true
  }

  test30() {
    const holder = new PropsHolder<StatusProps>({ status: 'inactive' });
    return this.isStatus(holder.value, 'inactive'); // Matching → true
  }

  test32() {
    const holder = new PropsHolder<AlignProps>({ align: 'center' });
    return this.isAlign(holder.value, 'center'); // Matching → true
  }

  test34() {
    const holder = new PropsHolder<GenderProps>({ gender: 'male' });
    return this.isGender(holder.value, 'male'); // Matching → true
  }

  test36() {
    const holder = new PropsHolder<NetworkProps>({ network: '5g' });
    return this.isNetwork(holder.value, '5g'); // Matching → true
  }

  // 51-60: Cross-type Comparison (Original 61-70 Scenarios)
  test38() {
    const dir: Direction = 'left';
    const pos: Position = Position.Left;
    return dir === pos; // Equal value → true
  }

  test39() {
    const size: Size = 'medium';
    const prio: Priority = 'medium';
    return size === prio; // Equal value → true
  }

  // 61-70: Optional Properties with Default Values (Original 71-80 Scenarios)
  test40() {
    const holder = new PropsHolder<DirectionProps>({});
    return holder.value === undefined; // No property → true
  }

  test43() {
    const holder = new PropsHolder<ModeProps>({});
    return holder.value ?? 'light' === 'light'; // Default value → true
  }

  test45() {
    const holder = new PropsHolder<ShapeProps>({});
    return holder.value ?? 'circle' === 'circle'; // Default value → true
  }

  test46() {
    const holder = new PropsHolder<GenderProps>({ gender: 'female' });
    return holder.value === 'female'; // Has value → true
  }

  test47() {
    const holder = new PropsHolder<LanguageProps>({});
    return holder.value ?? 'zh' === 'zh'; // Default value → true
  }

  test48() {
    const holder = new PropsHolder<NetworkProps>({ network: 'offline' });
    return holder.value === 'offline'; // Has value → true
  }

  test49() {
    const holder = new PropsHolder<PriorityProps>({});
    return holder.value ?? 'medium' === 'medium'; // Default value → true
  }

  // 71-80: Combined Type Conversion (Original 81-90 Scenarios)
  test50() {
    const holder = new PropsHolder<DirectionAndSizeProps>({ dir: 'right', size: 'large' });
    const casted = holder.props as FormatAndDirectionProps;
    return casted.dir === 'right' && casted.format === undefined; // Partial matching → true
  }

  test52() {
    const holder = new PropsHolder<GenderAndLanguageProps>({ gender: 'male', lang: 'en' });
    const casted = holder.props as LanguageProps;
    return casted.lang === 'en'; // Inheritance matching → true
  }

  test53() {
    const holder = new PropsHolder<NetworkAndPriorityProps>({ network: 'wifi', priority: 'high' });
    const casted = holder.props as NetworkProps;
    return casted.network === 'wifi'; // Inheritance matching → true
  }

  test55() {
    const holder = new PropsHolder<FormatAndDirectionProps>({ format: Format.Csv, dir: 'down' });
    const casted = holder.props as DirectionProps;
    return casted.dir === 'down'; // Inheritance matching → true
  }

  // 81-90: Complex Objects with Type Assertion (First 8 of Original 91-100 Scenarios)
  test58() {
    const obj = { props: { dir: 'up', size: 'medium' } } as { props: DirectionAndSizeProps };
    return obj.props.dir === 'up' && obj.props.size === 'medium'; // Correct assertion → true
  }

  test60() {
    const obj = { state: { visibility: Visibility.Hidden, sort: Sort.Desc } } as { state: VisibilityAndSortProps };
    return obj.state.visibility === Visibility.Hidden && obj.state.sort === Sort.Desc; // Correct assertion → true
  }

  test62() {
    const obj = { user: { gender: 'other', lang: 'ko' } } as { user: GenderAndLanguageProps };
    return obj.user.gender === 'other' && obj.user.lang === 'ko'; // Correct assertion → true
  }

  test64() {
    const obj = { align: { align: 'center', shape: 'rectangle' } } as { align: AlignAndShapeProps };
    return obj.align.align === 'center' && obj.align.shape === 'rectangle'; // Correct assertion → true
  }

  // 91-100: Supplement Remaining Complex Object with Type Assertion Scenarios (Original 99-100) and New Scenarios
  test66() {
    const obj = { dir: { dir: 'down', size: 'large' } } as { dir: DirectionAndSizeProps };
    return obj.dir.dir === 'down' && obj.dir.size === 'large'; // Correct assertion → true
  }

  // New Scenarios 68-100: Supplement Missing Scenario Coverage (Maintain Type Combination Consistency)
  test69() {
    const holder = new PropsHolder<FormatAndDirectionProps>({ format: Format.Json, dir: 'up' });
    const casted = holder.props as DirectionAndSizeProps;
    return casted.dir === 'up' && casted.size === undefined; // Partial matching → true
  }

  test70() {
    const obj: { mix: ThemeAndPositionProps } = { mix: { theme: Theme.Dark, position: Position.Right } };
    return obj.mix.theme === Theme.Dark && obj.mix.position === Position.Right; // Matching → true
  }

  test71() {
    const dir: Direction = 'right';
    const pos: Position = Position.Right;
    return dir === pos; // Equal value → true
  }

  test74() {
    const obj: { config: SizeAndPriorityProps } = { config: { size: 'large', priority: 'high' } };
    return obj.config.size === 'large' && obj.config.priority === 'high'; // Matching → true
  }

  test80() {
    const obj: { net: NetworkAndModeProps } = { net: { network: '5g', mode: 'dark' } };
    return obj.net.network === '5g' && obj.net.mode === 'dark'; // Matching → true
  }

  test82() {
    const enumVal = Theme.Auto;
    const literal: Mode = enumVal as Mode;
    return literal === 'auto'; // Conversion matching → true
  }

  test83() {
    const obj: { align: AlignAndStatusProps } = { align: { align: 'center', status: 'disabled' } };
    return obj.align.align === 'center' && obj.align.status === 'disabled'; // Matching → true
  }

  test97() {
    const obj: { user: GenderAndLanguageProps } = { user: { gender: 'female', lang: 'zh' } };
    return obj.user.gender === 'female' && obj.user.lang === 'zh'; // Matching → true
  }

  test98() {
    const enumVal = Theme.Light;
    const literal: Mode = enumVal as Mode;
    return literal === 'light'; // Conversion matching → true
  }

  test100() {
    const obj: { task: PriorityAndSizeProps } = { task: { priority: 'medium', size: 'small' } };
    return obj.task.priority === 'medium' && obj.task.size === 'small'; // Matching → true
  }

  private isDirection(val: Direction | undefined, target: Direction): boolean {
    return val === target;
  }

  private isStatus(val: Status | undefined, target: Status): boolean {
    return val === target;
  }

  private isAlign(val: Align | undefined, target: Align): boolean {
    return val === target;
  }

  private isGender(val: Gender | undefined, target: Gender): boolean {
    return val === target;
  }

  private isNetwork(val: Network | undefined, target: Network): boolean {
    return val === target;
  }
}

// New Supplementary Interfaces (for test68-100 Scenarios, Maintain Type Combination Integrity)
interface SizeAndPriorityProps extends SizeProps, PriorityProps {}

interface NetworkAndModeProps extends NetworkProps, ModeProps {}

interface AlignAndStatusProps extends AlignProps, StatusProps {}

interface PriorityAndSizeProps extends PriorityProps, SizeProps {}