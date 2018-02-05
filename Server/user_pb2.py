# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: user.proto

import sys
_b=sys.version_info[0]<3 and (lambda x:x) or (lambda x:x.encode('latin1'))
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
from google.protobuf import descriptor_pb2
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='user.proto',
  package='',
  syntax='proto3',
  serialized_pb=_b('\n\nuser.proto\"\x8f\x01\n\x04User\x12\x10\n\x08username\x18\x01 \x01(\t\x12\x0e\n\x06userID\x18\x02 \x01(\t\x12\x16\n\x06\x62rands\x18\x03 \x03(\x0b\x32\x06.Brand\x12\x1c\n\x04type\x18\x04 \x01(\x0e\x32\x0e.User.UserType\"/\n\x08UserType\x12\x0b\n\x07MANAGER\x10\x00\x12\n\n\x06\x45\x44ITOR\x10\x01\x12\n\n\x06WRITER\x10\x02\"\x86\x03\n\x05\x42rand\x12\x12\n\nbrand_name\x18\x01 \x01(\t\x12\x1e\n\x04type\x18\x02 \x01(\x0e\x32\x10.Brand.BrandType\"\xc8\x02\n\tBrandType\x12\x12\n\x0e\x43OASTAL_LIVING\x10\x00\x12\x11\n\rCOOKING_LIGHT\x10\x01\x12\x06\n\x02\x45W\x10\x02\x12\x10\n\x0c\x45XTRA_CRISPY\x10\x03\x12\x0c\n\x08\x46\x41NSIDED\x10\x04\x12\x0b\n\x07\x46_AND_W\x10\x05\x12\x0b\n\x07\x46ORTUNE\x10\x06\x12\x0b\n\x07\x46OUNDRY\x10\x07\x12\n\n\x06HEALTH\x10\x08\x12\x06\n\x02HG\x10\t\x12\x0b\n\x07INSTYLE\x10\n\x12\x0b\n\x07LIFE_VR\x10\x0b\x12\t\n\x05MONEY\x10\x0c\x12\x07\n\x03MRE\x10\r\x12\r\n\tPEOPLE_TV\x10\x0e\x12\n\n\x06PEOPLE\x10\x0f\x12\x08\n\x04PESP\x10\x10\x12\x0f\n\x0bREAL_SIMPLE\x10\x11\x12\n\n\x06SIKIDS\x10\x12\x12\x13\n\x0fSOUTHERN_LIVING\x10\x13\x12\x06\n\x02SI\x10\x14\x12\r\n\tTHE_DRIVE\x10\x15\x12\x08\n\x04TIME\x10\x16\x12\x0b\n\x07T_AND_L\x10\x17\x62\x06proto3')
)
_sym_db.RegisterFileDescriptor(DESCRIPTOR)



_USER_USERTYPE = _descriptor.EnumDescriptor(
  name='UserType',
  full_name='User.UserType',
  filename=None,
  file=DESCRIPTOR,
  values=[
    _descriptor.EnumValueDescriptor(
      name='MANAGER', index=0, number=0,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='EDITOR', index=1, number=1,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='WRITER', index=2, number=2,
      options=None,
      type=None),
  ],
  containing_type=None,
  options=None,
  serialized_start=111,
  serialized_end=158,
)
_sym_db.RegisterEnumDescriptor(_USER_USERTYPE)

_BRAND_BRANDTYPE = _descriptor.EnumDescriptor(
  name='BrandType',
  full_name='Brand.BrandType',
  filename=None,
  file=DESCRIPTOR,
  values=[
    _descriptor.EnumValueDescriptor(
      name='COASTAL_LIVING', index=0, number=0,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='COOKING_LIGHT', index=1, number=1,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='EW', index=2, number=2,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='EXTRA_CRISPY', index=3, number=3,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='FANSIDED', index=4, number=4,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='F_AND_W', index=5, number=5,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='FORTUNE', index=6, number=6,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='FOUNDRY', index=7, number=7,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='HEALTH', index=8, number=8,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='HG', index=9, number=9,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='INSTYLE', index=10, number=10,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='LIFE_VR', index=11, number=11,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MONEY', index=12, number=12,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='MRE', index=13, number=13,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='PEOPLE_TV', index=14, number=14,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='PEOPLE', index=15, number=15,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='PESP', index=16, number=16,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='REAL_SIMPLE', index=17, number=17,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SIKIDS', index=18, number=18,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SOUTHERN_LIVING', index=19, number=19,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='SI', index=20, number=20,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='THE_DRIVE', index=21, number=21,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='TIME', index=22, number=22,
      options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='T_AND_L', index=23, number=23,
      options=None,
      type=None),
  ],
  containing_type=None,
  options=None,
  serialized_start=223,
  serialized_end=551,
)
_sym_db.RegisterEnumDescriptor(_BRAND_BRANDTYPE)


_USER = _descriptor.Descriptor(
  name='User',
  full_name='User',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='username', full_name='User.username', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='userID', full_name='User.userID', index=1,
      number=2, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='brands', full_name='User.brands', index=2,
      number=3, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='type', full_name='User.type', index=3,
      number=4, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
    _USER_USERTYPE,
  ],
  options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=15,
  serialized_end=158,
)


_BRAND = _descriptor.Descriptor(
  name='Brand',
  full_name='Brand',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='brand_name', full_name='Brand.brand_name', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
    _descriptor.FieldDescriptor(
      name='type', full_name='Brand.type', index=1,
      number=2, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      options=None),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
    _BRAND_BRANDTYPE,
  ],
  options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=161,
  serialized_end=551,
)

_USER.fields_by_name['brands'].message_type = _BRAND
_USER.fields_by_name['type'].enum_type = _USER_USERTYPE
_USER_USERTYPE.containing_type = _USER
_BRAND.fields_by_name['type'].enum_type = _BRAND_BRANDTYPE
_BRAND_BRANDTYPE.containing_type = _BRAND
DESCRIPTOR.message_types_by_name['User'] = _USER
DESCRIPTOR.message_types_by_name['Brand'] = _BRAND

User = _reflection.GeneratedProtocolMessageType('User', (_message.Message,), dict(
  DESCRIPTOR = _USER,
  __module__ = 'user_pb2'
  # @@protoc_insertion_point(class_scope:User)
  ))
_sym_db.RegisterMessage(User)

Brand = _reflection.GeneratedProtocolMessageType('Brand', (_message.Message,), dict(
  DESCRIPTOR = _BRAND,
  __module__ = 'user_pb2'
  # @@protoc_insertion_point(class_scope:Brand)
  ))
_sym_db.RegisterMessage(Brand)


# @@protoc_insertion_point(module_scope)