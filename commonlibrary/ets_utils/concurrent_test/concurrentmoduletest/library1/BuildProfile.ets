/**
 * Use these variables when you tailor your ArkTS code. They must be of the const type.
 */
export const HAR_VERSION = '1.0.0';
export const BUILD_MODE_NAME = 'debug';
export const DEBUG = true;
export const TARGET_NAME = 'default';

/**
 * BuildProfile Class is used only for compatibility purposes.
 */
export default class BuildProfile { 
	public static readonly HAR_VERSION:string = HAR_VERSION;
	public static readonly BUILD_MODE_NAME:string  = BUILD_MODE_NAME;
	public static readonly DEBUG:boolean = DEBUG;
	public static readonly TARGET_NAME:string  = TARGET_NAME;
}