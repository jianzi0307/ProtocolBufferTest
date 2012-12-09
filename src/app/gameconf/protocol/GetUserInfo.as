package  app.gameconf.protocol {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.gameconf.protocol.GetUserInfo.FrdSmpInfo;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class GetUserInfo extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("GetUserInfo.uid", "uid", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var uid:String;

		/**
		 *  @private
		 */
		public static const UUID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("GetUserInfo.uuid", "uuid", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var uuid:String;

		/**
		 *  @private
		 */
		public static const UNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("GetUserInfo.uname", "uname", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var uname:String;

		/**
		 *  @private
		 */
		public static const AGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("GetUserInfo.age", "age", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var age:int;

		/**
		 *  @private
		 */
		public static const SEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("GetUserInfo.sex", "sex", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		public var sex:int;

		/**
		 *  @private
		 */
		public static const ISVIP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("GetUserInfo.isvip", "isvip", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		public var isvip:Boolean;

		/**
		 *  @private
		 */
		public static const VIPLV:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("GetUserInfo.viplv", "viplv", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		public var viplv:int;

		/**
		 *  @private
		 */
		public static const LUCKY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("GetUserInfo.lucky", "lucky", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		public var lucky:int;

		/**
		 *  @private
		 */
		public static const LINQ:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("GetUserInfo.linq", "linq", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		public var linq:int;

		/**
		 *  @private
		 */
		public static const JLING:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("GetUserInfo.jling", "jling", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		public var jling:int;

		/**
		 *  @private
		 */
		public static const FUIDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("GetUserInfo.fuids", "fuids", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return FrdSmpInfo; });

		[ArrayElementType("app.gameconf.protocol.GetUserInfo.FrdSmpInfo")]
		public var fuids:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.uid);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.uuid);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.uname);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.age);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.sex);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
			com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, this.isvip);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.viplv);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.lucky);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.linq);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.jling);
			for (var fuids$index:uint = 0; fuids$index < this.fuids.length; ++fuids$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.fuids[fuids$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var uid$count:uint = 0;
			var uuid$count:uint = 0;
			var uname$count:uint = 0;
			var age$count:uint = 0;
			var sex$count:uint = 0;
			var isvip$count:uint = 0;
			var viplv$count:uint = 0;
			var lucky$count:uint = 0;
			var linq$count:uint = 0;
			var jling$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetUserInfo.uid cannot be set twice.');
					}
					++uid$count;
					this.uid = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (uuid$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetUserInfo.uuid cannot be set twice.');
					}
					++uuid$count;
					this.uuid = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (uname$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetUserInfo.uname cannot be set twice.');
					}
					++uname$count;
					this.uname = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (age$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetUserInfo.age cannot be set twice.');
					}
					++age$count;
					this.age = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (sex$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetUserInfo.sex cannot be set twice.');
					}
					++sex$count;
					this.sex = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (isvip$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetUserInfo.isvip cannot be set twice.');
					}
					++isvip$count;
					this.isvip = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				case 7:
					if (viplv$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetUserInfo.viplv cannot be set twice.');
					}
					++viplv$count;
					this.viplv = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (lucky$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetUserInfo.lucky cannot be set twice.');
					}
					++lucky$count;
					this.lucky = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (linq$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetUserInfo.linq cannot be set twice.');
					}
					++linq$count;
					this.linq = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (jling$count != 0) {
						throw new flash.errors.IOError('Bad data format: GetUserInfo.jling cannot be set twice.');
					}
					++jling$count;
					this.jling = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					this.fuids.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new FrdSmpInfo()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
