<?php

namespace AppBundle\Mailchimp\Synchronisation\Request;

class MemberRequest implements MemberRequestInterface
{
    public const MERGE_FIELD_GENDER = 'GENDER';
    public const MERGE_FIELD_FIRST_NAME = 'FIRST_NAME';
    public const MERGE_FIELD_LAST_NAME = 'LAST_NAME';
    public const MERGE_FIELD_BIRTHDATE = 'BIRTHDATE';
    public const MERGE_FIELD_CITY = 'CITY';
    public const MERGE_FIELD_ZIP_CODE = 'ZIP_CODE';
    public const MERGE_FIELD_TAGS = 'TAGS';
    public const MERGE_FIELD_COMMITTEE_FOLLOWER = 'COMM_FLLWR';
    public const MERGE_FIELD_COMMITTEE_SUPERVISOR = 'COMM_SUPVR';
    public const MERGE_FIELD_COMMITTEE_HOST = 'COMM_HOST';
    public const MERGE_FIELD_CITIZEN_PROJECT_HOST = 'CP_HOST';

    private $memberIdentifier;

    private $emailAddress;
    private $emailType = 'html'; // or 'text'
    private $status = 'subscribed';
    private $mergeFields = [];
    private $interests = [];

    public function __construct(string $memberIdentifier)
    {
        $this->memberIdentifier = $memberIdentifier;
    }

    public function getMemberIdentifier(): string
    {
        return $this->memberIdentifier;
    }

    public function setEmailAddress($emailAddress): void
    {
        $this->emailAddress = $emailAddress;
    }

    public function setStatus($status): void
    {
        $this->status = $status;
    }

    public function setMergeFields(array $mergeFields): void
    {
        $this->mergeFields = $mergeFields;
    }

    public function setInterests(array $interests): void
    {
        $this->interests = $interests;
    }

    public function toArray(): array
    {
        return [
            'email_address' => $this->emailAddress ?? $this->memberIdentifier,
            'email_type' => $this->emailType,
            'status' => $this->status,
            'merge_fields' => $this->mergeFields,
            'interests' => $this->interests,
        ];
    }
}
