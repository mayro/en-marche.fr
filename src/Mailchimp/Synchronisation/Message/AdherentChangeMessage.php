<?php

namespace AppBundle\Mailchimp\Synchronisation\Message;

use Ramsey\Uuid\UuidInterface;

class AdherentChangeMessage implements AdherentMessageInterface
{
    private $uuid;
    private $emailAddress;
    private $removedTags;

    public function __construct(UuidInterface $uuid, string $emailAddress, array $removedTags = [])
    {
        $this->uuid = $uuid;
        $this->emailAddress = strtolower($emailAddress);
        $this->removedTags = $removedTags;
    }

    public function getUuid(): UuidInterface
    {
        return $this->uuid;
    }

    public function getEmailAddress(): string
    {
        return $this->emailAddress;
    }

    public function getRemovedTags(): array
    {
        return $this->removedTags;
    }
}
